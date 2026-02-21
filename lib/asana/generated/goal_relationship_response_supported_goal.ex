defmodule Asana.Generated.GoalRelationshipResponseSupportedGoal do
  @moduledoc """
  Provides struct and type for a GoalRelationshipResponseSupportedGoal
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          name: String.t() | nil,
          owner: map | nil,
          resource_type: String.t() | nil
        }

  defstruct [:gid, :name, :owner, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, name: :string, owner: :map, resource_type: :string]
  end
end
