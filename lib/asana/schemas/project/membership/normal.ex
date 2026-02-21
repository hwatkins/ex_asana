defmodule Asana.Project.Membership.Normal do
  @moduledoc """
  Provides struct and type for a Project.Membership.Normal
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          gid: String.t() | nil,
          member: Asana.Member.compact() | nil,
          parent: Asana.Project.compact() | nil,
          project: Asana.Project.compact() | nil,
          resource_type: String.t() | nil,
          user: Asana.User.compact() | nil,
          write_access: String.t() | nil
        }

  defstruct [
    :__info__,
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
  def __fields__(:response) do
    [
      access_level: {:enum, ["admin", "editor", "commenter", "viewer"]},
      gid: :string,
      member: {Asana.Member, :compact},
      parent: {Asana.Project, :compact},
      project: {Asana.Project, :compact},
      resource_type: :string,
      user: {Asana.User, :compact},
      write_access: {:enum, ["full_write", "comment_only"]}
    ]
  end
end
