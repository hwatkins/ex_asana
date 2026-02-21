defmodule Asana.Goal.RelationshipRequest do
  @moduledoc """
  Provides struct and type for a Goal.RelationshipRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          contribution_weight: number | nil,
          gid: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          supported_goal: Asana.Goal.RelationshipRequestSupportedGoal.t() | nil,
          supporting_resource: Asana.Goal.RelationshipRequestSupportingResource.t() | nil
        }

  defstruct [
    :__info__,
    :contribution_weight,
    :gid,
    :resource_subtype,
    :resource_type,
    :supported_goal,
    :supporting_resource
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      contribution_weight: :number,
      gid: :string,
      resource_subtype: {:enum, ["subgoal", "supporting_work"]},
      resource_type: :string,
      supported_goal: {Asana.Goal.RelationshipRequestSupportedGoal, :t},
      supporting_resource: {Asana.Goal.RelationshipRequestSupportingResource, :t}
    ]
  end
end
