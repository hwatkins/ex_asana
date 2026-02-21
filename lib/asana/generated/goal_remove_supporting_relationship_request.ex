defmodule Asana.Generated.GoalRemoveSupportingRelationshipRequest do
  @moduledoc """
  Provides struct and type for a GoalRemoveSupportingRelationshipRequest
  """

  @type t :: %__MODULE__{supporting_resource: String.t()}

  defstruct [:supporting_resource]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [supporting_resource: :string]
  end
end
