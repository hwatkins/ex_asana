defmodule Asana.Generated.GoalRelationshipCompact do
  @moduledoc """
  Provides struct and type for a GoalRelationshipCompact
  """

  @type t :: %__MODULE__{
          contribution_weight: number | nil,
          gid: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          supporting_resource: Asana.Generated.GoalRelationshipCompactSupportingResource.t() | nil
        }

  defstruct [:contribution_weight, :gid, :resource_subtype, :resource_type, :supporting_resource]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      contribution_weight: :number,
      gid: :string,
      resource_subtype: {:enum, ["subgoal", "supporting_work"]},
      resource_type: :string,
      supporting_resource: {Asana.Generated.GoalRelationshipCompactSupportingResource, :t}
    ]
  end
end
