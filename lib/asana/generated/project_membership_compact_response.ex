defmodule Asana.Generated.ProjectMembershipCompactResponse do
  @moduledoc """
  Provides struct and type for a ProjectMembershipCompactResponse
  """

  @type t :: %__MODULE__{
          access_level: String.t() | nil,
          gid: String.t() | nil,
          member: Asana.Generated.MemberCompact.t() | nil,
          parent: Asana.Generated.ProjectCompact.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:access_level, :gid, :member, :parent, :resource_subtype, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_level: {:enum, ["admin", "editor", "commenter", "viewer"]},
      gid: :string,
      member: {Asana.Generated.MemberCompact, :t},
      parent: {Asana.Generated.ProjectCompact, :t},
      resource_subtype: :string,
      resource_type: :string
    ]
  end
end
