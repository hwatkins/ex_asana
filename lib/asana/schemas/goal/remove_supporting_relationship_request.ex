defmodule Asana.Goal.RemoveSupportingRelationshipRequest do
  @moduledoc """
  Provides struct and type for a Goal.RemoveSupportingRelationshipRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, supporting_resource: String.t()}

  defstruct [:__info__, :supporting_resource]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [supporting_resource: :string]
  end
end
