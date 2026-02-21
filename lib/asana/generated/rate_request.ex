defmodule Asana.Generated.RateRequest do
  @moduledoc """
  Provides struct and type for a RateRequest
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          parent: String.t(),
          rate: number,
          resource: String.t(),
          resource_type: String.t() | nil
        }

  defstruct [:gid, :parent, :rate, :resource, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, parent: :string, rate: :number, resource: :string, resource_type: :string]
  end
end
