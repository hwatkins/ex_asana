defmodule Asana.Goal.Membership do
  @moduledoc """
  Provides struct and types for a Goal.Membership
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          gid: String.t() | nil,
          goal: Asana.Goal.MembershipGoal.compact() | nil,
          is_commenter: boolean | nil,
          is_editor: boolean | nil,
          member: Asana.Member.compact() | nil,
          parent: Asana.Goal.MembershipParent.compact() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          role: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          gid: String.t() | nil,
          goal: Asana.Goal.MembershipGoal.response() | nil,
          member: Asana.Member.compact() | nil,
          parent: Asana.Goal.MembershipParent.response() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          role: String.t() | nil,
          user: Asana.Goal.MembershipUser.response() | nil,
          workspace: Asana.Goal.MembershipWorkspace.response() | nil
        }

  defstruct [
    :__info__,
    :access_level,
    :gid,
    :goal,
    :is_commenter,
    :is_editor,
    :member,
    :parent,
    :resource_subtype,
    :resource_type,
    :role,
    :user,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      access_level: {:enum, ["viewer", "commenter", "editor", "admin"]},
      gid: :string,
      goal: {Asana.Goal.MembershipGoal, :compact},
      is_commenter: :boolean,
      is_editor: :boolean,
      member: {Asana.Member, :compact},
      parent: {Asana.Goal.MembershipParent, :compact},
      resource_subtype: :string,
      resource_type: :string,
      role: {:enum, ["commenter", "editor"]}
    ]
  end

  def __fields__(:response) do
    [
      access_level: {:enum, ["viewer", "commenter", "editor", "admin"]},
      gid: :string,
      goal: {Asana.Goal.MembershipGoal, :response},
      member: {Asana.Member, :compact},
      parent: {Asana.Goal.MembershipParent, :response},
      resource_subtype: :string,
      resource_type: :string,
      role: {:enum, ["commenter", "editor"]},
      user: {Asana.Goal.MembershipUser, :response},
      workspace: {Asana.Goal.MembershipWorkspace, :response}
    ]
  end
end
