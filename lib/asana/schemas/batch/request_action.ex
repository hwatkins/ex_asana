defmodule Asana.Batch.RequestAction do
  @moduledoc """
  Provides struct and type for a Batch.RequestAction
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          data: map | nil,
          method: String.t(),
          options: Asana.Batch.RequestActionOptions.t() | nil,
          relative_path: String.t()
        }

  defstruct [:__info__, :data, :method, :options, :relative_path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: :map,
      method: {:enum, ["get", "post", "put", "delete", "patch", "head"]},
      options: {Asana.Batch.RequestActionOptions, :t},
      relative_path: :string
    ]
  end
end
