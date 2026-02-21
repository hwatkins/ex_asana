defmodule Asana.Rate.UpdateRequest do
  @moduledoc """
  Provides struct and type for a Rate.UpdateRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          rate: number | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :gid, :rate, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, rate: :number, resource_type: :string]
  end
end
