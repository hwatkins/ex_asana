defmodule Asana.Rule.TriggerRequest do
  @moduledoc """
  Provides struct and type for a Rule.TriggerRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, action_data: map, resource: String.t()}

  defstruct [:__info__, :action_data, :resource]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [action_data: :map, resource: :string]
  end
end
