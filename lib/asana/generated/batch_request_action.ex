defmodule Asana.Generated.BatchRequestAction do
  @moduledoc """
  Provides struct and type for a BatchRequestAction
  """

  @type t :: %__MODULE__{
          data: map | nil,
          method: String.t(),
          options: Asana.Generated.BatchRequestActionOptions.t() | nil,
          relative_path: String.t()
        }

  defstruct [:data, :method, :options, :relative_path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: :map,
      method: {:enum, ["get", "post", "put", "delete", "patch", "head"]},
      options: {Asana.Generated.BatchRequestActionOptions, :t},
      relative_path: :string
    ]
  end
end
