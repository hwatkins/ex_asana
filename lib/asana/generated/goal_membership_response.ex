defmodule Asana.Generated.GoalMembershipResponse do
  @moduledoc """
  Provides struct and type for a GoalMembershipResponse
  """

  @type t :: %__MODULE__{
          access_level: String.t() | nil,
          gid: String.t() | nil,
          goal: Asana.Generated.GoalMembershipResponseGoal.t() | nil,
          member: Asana.Generated.MemberCompact.t() | nil,
          parent: Asana.Generated.GoalMembershipResponseParent.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          role: String.t() | nil,
          user: Asana.Generated.GoalMembershipResponseUser.t() | nil,
          workspace: Asana.Generated.GoalMembershipResponseWorkspace.t() | nil
        }

  defstruct [
    :access_level,
    :gid,
    :goal,
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
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_level: {:enum, ["viewer", "commenter", "editor", "admin"]},
      gid: :string,
      goal: {Asana.Generated.GoalMembershipResponseGoal, :t},
      member: {Asana.Generated.MemberCompact, :t},
      parent: {Asana.Generated.GoalMembershipResponseParent, :t},
      resource_subtype: :string,
      resource_type: :string,
      role: {:enum, ["commenter", "editor"]},
      user: {Asana.Generated.GoalMembershipResponseUser, :t},
      workspace: {Asana.Generated.GoalMembershipResponseWorkspace, :t}
    ]
  end
end
