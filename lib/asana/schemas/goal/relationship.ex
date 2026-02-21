defmodule Asana.Goal.Relationship do
  @moduledoc """
  Provides struct and types for a Goal.Relationship
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          contribution_weight: number | nil,
          gid: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          supporting_resource: Asana.Goal.RelationshipSupportingResource.compact() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          contribution_weight: number | nil,
          gid: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          supported_goal: Asana.Goal.RelationshipSupportedGoal.response() | nil,
          supporting_resource: Asana.Goal.RelationshipSupportingResource.response() | nil
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
  def __fields__(:compact) do
    [
      contribution_weight: :number,
      gid: :string,
      resource_subtype: {:enum, ["subgoal", "supporting_work"]},
      resource_type: :string,
      supporting_resource: {Asana.Goal.RelationshipSupportingResource, :compact}
    ]
  end

  def __fields__(:response) do
    [
      contribution_weight: :number,
      gid: :string,
      resource_subtype: {:enum, ["subgoal", "supporting_work"]},
      resource_type: :string,
      supported_goal: {Asana.Goal.RelationshipSupportedGoal, :response},
      supporting_resource: {Asana.Goal.RelationshipSupportingResource, :response}
    ]
  end
end
