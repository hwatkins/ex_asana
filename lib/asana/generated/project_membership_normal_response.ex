defmodule Asana.Generated.ProjectMembershipNormalResponse do
  @moduledoc """
  Provides struct and type for a ProjectMembershipNormalResponse
  """

  @type t :: %__MODULE__{
          access_level: String.t() | nil,
          gid: String.t() | nil,
          member: Asana.Generated.MemberCompact.t() | nil,
          parent: Asana.Generated.ProjectCompact.t() | nil,
          project: Asana.Generated.ProjectCompact.t() | nil,
          resource_type: String.t() | nil,
          user: Asana.Generated.UserCompact.t() | nil,
          write_access: String.t() | nil
        }

  defstruct [
    :access_level,
    :gid,
    :member,
    :parent,
    :project,
    :resource_type,
    :user,
    :write_access
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_level: {:enum, ["admin", "editor", "commenter", "viewer"]},
      gid: :string,
      member: {Asana.Generated.MemberCompact, :t},
      parent: {Asana.Generated.ProjectCompact, :t},
      project: {Asana.Generated.ProjectCompact, :t},
      resource_type: :string,
      user: {Asana.Generated.UserCompact, :t},
      write_access: {:enum, ["full_write", "comment_only"]}
    ]
  end
end
