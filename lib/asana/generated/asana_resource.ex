defmodule Asana.Generated.AsanaResource do
  @moduledoc """
  Provides struct and type for a AsanaResource
  """

  @type t :: %__MODULE__{gid: String.t() | nil, resource_type: String.t() | nil}

  defstruct [:gid, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, resource_type: :string]
  end
end
