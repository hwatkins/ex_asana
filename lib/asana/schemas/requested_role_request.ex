defmodule Asana.RequestedRoleRequest do
  @moduledoc """
  Provides struct and type for a RequestedRoleRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, gid: String.t() | nil, value: String.t() | nil}

  defstruct [:__info__, :gid, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, value: :string]
  end
end
