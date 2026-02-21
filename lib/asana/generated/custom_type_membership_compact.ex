defmodule Asana.Generated.CustomTypeMembershipCompact do
  @moduledoc """
  Provides struct and type for a CustomTypeMembershipCompact
  """

  @type t :: %__MODULE__{
          access_level: String.t() | nil,
          gid: String.t() | nil,
          member: Asana.Generated.MemberCompact.t() | nil,
          parent: Asana.Generated.CustomTypeCompact.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:access_level, :gid, :member, :parent, :resource_subtype, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_level: {:enum, ["admin", "editor", "user", "viewer"]},
      gid: :string,
      member: {Asana.Generated.MemberCompact, :t},
      parent: {Asana.Generated.CustomTypeCompact, :t},
      resource_subtype: :string,
      resource_type: :string
    ]
  end
end
