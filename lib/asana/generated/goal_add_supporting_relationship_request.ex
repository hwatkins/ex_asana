defmodule Asana.Generated.GoalAddSupportingRelationshipRequest do
  @moduledoc """
  Provides struct and type for a GoalAddSupportingRelationshipRequest
  """

  @type t :: %__MODULE__{
          contribution_weight: number | nil,
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          supporting_resource: String.t()
        }

  defstruct [:contribution_weight, :insert_after, :insert_before, :supporting_resource]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      contribution_weight: :number,
      insert_after: :string,
      insert_before: :string,
      supporting_resource: :string
    ]
  end
end
