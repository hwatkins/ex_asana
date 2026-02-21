defmodule Asana.Batch do
  @moduledoc """
  Provides struct and type for a Batch
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          body: map | nil,
          headers: map | nil,
          status_code: integer | nil
        }

  defstruct [:__info__, :body, :headers, :status_code]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [body: :map, headers: :map, status_code: :integer]
  end
end
