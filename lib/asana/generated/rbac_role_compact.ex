defmodule Asana.Generated.RbacRoleCompact do
  @moduledoc """
  Provides struct and type for a RbacRoleCompact
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          gid: String.t() | nil,
          is_standard_role: boolean | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:description, :gid, :is_standard_role, :name, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      gid: :string,
      is_standard_role: :boolean,
      name: :string,
      resource_type: :string
    ]
  end
end
