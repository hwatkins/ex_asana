defmodule Asana.Generated.RuleTriggerRequest do
  @moduledoc """
  Provides struct and type for a RuleTriggerRequest
  """

  @type t :: %__MODULE__{action_data: map, resource: String.t()}

  defstruct [:action_data, :resource]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [action_data: :map, resource: :string]
  end
end
