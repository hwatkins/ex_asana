defmodule Asana.Budget.RequestEstimate do
  @moduledoc """
  Provides struct and type for a Budget.RequestEstimate
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billable_status_filter: String.t() | nil,
          enabled: boolean | nil,
          source: String.t() | nil
        }

  defstruct [:__info__, :billable_status_filter, :enabled, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_status_filter: {:enum, ["billable", "non_billable", "any"]},
      enabled: :boolean,
      source: {:enum, ["none", "tasks", "capacity_plans"]}
    ]
  end
end
