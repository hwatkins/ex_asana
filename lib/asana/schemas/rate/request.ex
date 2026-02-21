defmodule Asana.Rate.Request do
  @moduledoc """
  Provides struct and type for a Rate.Request
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          parent: String.t(),
          rate: number,
          resource: String.t(),
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :gid, :parent, :rate, :resource, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, parent: :string, rate: :number, resource: :string, resource_type: :string]
  end
end
