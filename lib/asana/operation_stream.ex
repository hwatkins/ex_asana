defmodule Asana.OperationStream do
  @moduledoc """
  Stream helpers for generated operation functions that use Asana cursor pagination.
  """

  alias Asana.Error
  alias Asana.Pagination

  @type operation_fun :: (keyword() -> {:ok, map()} | {:error, term()})

  @spec list(operation_fun(), keyword()) :: Enumerable.t()
  def list(operation_fun, opts \\ []) when is_function(operation_fun, 1) and is_list(opts) do
    Pagination.stream(fn offset ->
      request_opts = maybe_put_offset(opts, offset)

      case operation_fun.(request_opts) do
        {:ok, body} -> {:ok, %{data: extract_data(body), next_offset: extract_next_offset(body)}}
        {:error, error} -> {:error, error}
        other -> {:error, Error.request_failure({:unexpected_response, other})}
      end
    end)
  end

  defp maybe_put_offset(opts, nil), do: opts
  defp maybe_put_offset(opts, offset), do: Keyword.put(opts, :offset, offset)

  defp extract_data(%{"data" => data}) when is_list(data), do: data
  defp extract_data(%{data: data}) when is_list(data), do: data
  defp extract_data(_), do: []

  defp extract_next_offset(%{"next_page" => %{"offset" => offset}}) when is_binary(offset),
    do: offset

  defp extract_next_offset(%{next_page: %{offset: offset}}) when is_binary(offset), do: offset
  defp extract_next_offset(_), do: nil
end
