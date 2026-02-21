defmodule Asana.Generated.BudgetResponseActual do
  @moduledoc """
  Provides struct and type for a BudgetResponseActual
  """

  @type t :: %__MODULE__{
          billable_status_filter: String.t() | nil,
          units: String.t() | nil,
          value: number | nil
        }

  defstruct [:billable_status_filter, :units, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_status_filter: {:enum, ["billable", "non_billable", "any"]},
      units: :string,
      value: :number
    ]
  end
end
