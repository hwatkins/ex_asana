defmodule Asana.Error do
  @moduledoc """
  Structured error returned by Asana client operations.
  """

  @type t :: %__MODULE__{
          status: non_neg_integer() | nil,
          message: String.t(),
          body: term()
        }

  defexception [:status, :message, :body]

  @spec from_response(non_neg_integer(), term()) :: t()
  def from_response(status, body) do
    %__MODULE__{
      status: status,
      message: extract_message(body),
      body: body
    }
  end

  @spec request_failure(term()) :: t()
  def request_failure(reason) do
    %__MODULE__{
      status: nil,
      message: "request_failed",
      body: reason
    }
  end

  defp extract_message(%{"errors" => [%{"message" => message} | _]}) when is_binary(message),
    do: message

  defp extract_message(%{errors: [%{message: message} | _]}) when is_binary(message), do: message
  defp extract_message(_), do: "request_failed"
end
