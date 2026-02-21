defmodule Asana.Generated.ProjectStatusCompact do
  @moduledoc """
  Provides struct and type for a ProjectStatusCompact
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          resource_type: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:gid, :resource_type, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, resource_type: :string, title: :string]
  end
end
