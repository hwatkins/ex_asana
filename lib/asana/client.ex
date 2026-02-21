defmodule Asana.Client do
  @moduledoc """
  Core HTTP client for Asana API requests.
  """

  alias Asana.Error

  @default_base_url "https://app.asana.com/api/1.0"
  @default_max_retries 1

  @type requester :: (keyword() -> {:ok, map()} | {:error, term()})
  @type sleep_fn :: (non_neg_integer() -> any())

  @type t :: %__MODULE__{
          token: String.t() | nil,
          base_url: String.t(),
          requester: requester(),
          sleep_fn: sleep_fn(),
          max_retries: non_neg_integer()
        }

  defstruct token: nil,
            base_url: @default_base_url,
            requester: &__MODULE__.request_via_req/1,
            sleep_fn: &Process.sleep/1,
            max_retries: @default_max_retries

  @spec new(keyword()) :: t()
  def new(opts \\ []) do
    %__MODULE__{
      token: Keyword.get(opts, :token, Application.get_env(:ex_asana, :token)),
      base_url:
        Keyword.get(opts, :base_url, Application.get_env(:ex_asana, :base_url, @default_base_url)),
      requester: Keyword.get(opts, :requester, &__MODULE__.request_via_req/1),
      sleep_fn: Keyword.get(opts, :sleep_fn, &Process.sleep/1),
      max_retries: Keyword.get(opts, :max_retries, @default_max_retries)
    }
  end

  @spec request(t(), keyword()) :: {:ok, term()} | {:error, Error.t()}
  def request(%__MODULE__{} = client, opts) when is_list(opts) do
    with {:ok, body} <- request_full(client, opts) do
      {:ok, unwrap_data(body)}
    end
  end

  @spec request_full(t(), keyword()) :: {:ok, map()} | {:error, Error.t()}
  def request_full(%__MODULE__{} = client, opts) when is_list(opts) do
    token = Keyword.get(opts, :token, client.token)

    if is_binary(token) and token != "" do
      request_opts =
        opts
        |> Keyword.delete(:token)
        |> Keyword.put(:auth, {:bearer, token})
        |> Keyword.put_new(:retry, false)
        |> Keyword.put_new(:base_url, client.base_url)

      do_request(client, request_opts, 0)
    else
      {:error, %Error{status: nil, message: "missing_token", body: %{reason: :missing_token}}}
    end
  end

  @doc false
  def request_via_req(opts) do
    Req.request(opts)
  end

  defp do_request(client, request_opts, attempt) do
    case client.requester.(request_opts) do
      {:ok, %{status: 429} = response} when attempt < client.max_retries ->
        client.sleep_fn.(retry_after_ms(response))
        do_request(client, request_opts, attempt + 1)

      {:ok, %{status: status, body: body}} when status in 200..299 ->
        {:ok, decode_body(body)}

      {:ok, %{status: status, body: body}} ->
        {:error, Error.from_response(status, decode_body(body))}

      {:error, reason} ->
        {:error, Error.request_failure(reason)}
    end
  end

  defp unwrap_data(%{"data" => data}), do: data
  defp unwrap_data(%{data: data}), do: data
  defp unwrap_data(body), do: body

  defp decode_body(body) when is_binary(body) do
    case Jason.decode(body) do
      {:ok, decoded} ->
        decoded

      _ ->
        body
    end
  end

  defp decode_body(body), do: body

  defp retry_after_ms(%{headers: headers}) when is_list(headers) do
    headers
    |> Enum.find_value(0, fn
      {"retry-after", value} -> parse_retry_after(value)
      {"Retry-After", value} -> parse_retry_after(value)
      _ -> nil
    end)
  end

  defp retry_after_ms(%{headers: headers}) when is_map(headers) do
    headers
    |> Map.get("retry-after", Map.get(headers, "Retry-After", 0))
    |> parse_retry_after()
  end

  defp retry_after_ms(_), do: 0

  defp parse_retry_after(value) when is_integer(value), do: value * 1000

  defp parse_retry_after(value) when is_binary(value) do
    case Integer.parse(value) do
      {seconds, ""} -> seconds * 1000
      _ -> 0
    end
  end

  defp parse_retry_after([value | _]), do: parse_retry_after(value)
  defp parse_retry_after(_), do: 0
end
