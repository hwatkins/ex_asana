defmodule Asana.Generated.GoalMembershipCompact do
  @moduledoc """
  Provides struct and type for a GoalMembershipCompact
  """

  @type t :: %__MODULE__{
          access_level: String.t() | nil,
          gid: String.t() | nil,
          goal: Asana.Generated.GoalMembershipCompactGoal.t() | nil,
          is_commenter: boolean | nil,
          is_editor: boolean | nil,
          member: Asana.Generated.MemberCompact.t() | nil,
          parent: Asana.Generated.GoalMembershipCompactParent.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          role: String.t() | nil
        }

  defstruct [
    :access_level,
    :gid,
    :goal,
    :is_commenter,
    :is_editor,
    :member,
    :parent,
    :resource_subtype,
    :resource_type,
    :role
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_level: {:enum, ["viewer", "commenter", "editor", "admin"]},
      gid: :string,
      goal: {Asana.Generated.GoalMembershipCompactGoal, :t},
      is_commenter: :boolean,
      is_editor: :boolean,
      member: {Asana.Generated.MemberCompact, :t},
      parent: {Asana.Generated.GoalMembershipCompactParent, :t},
      resource_subtype: :string,
      resource_type: :string,
      role: {:enum, ["commenter", "editor"]}
    ]
  end
end
