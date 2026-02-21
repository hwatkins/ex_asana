defmodule Asana.Generated.GoalMetricCurrentValueRequest do
  @moduledoc """
  Provides struct and type for a GoalMetricCurrentValueRequest
  """

  @type t :: %__MODULE__{
          current_number_value: number | nil,
          gid: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:current_number_value, :gid, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [current_number_value: :number, gid: :string, resource_type: :string]
  end
end
