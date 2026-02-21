defmodule Asana.Generated.RequestedRoleRequest do
  @moduledoc """
  Provides struct and type for a RequestedRoleRequest
  """

  @type t :: %__MODULE__{gid: String.t() | nil, value: String.t() | nil}

  defstruct [:gid, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, value: :string]
  end
end
