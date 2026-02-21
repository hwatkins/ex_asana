defmodule Asana.Generated.BudgetRequestActual do
  @moduledoc """
  Provides struct and type for a BudgetRequestActual
  """

  @type t :: %__MODULE__{billable_status_filter: String.t() | nil}

  defstruct [:billable_status_filter]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable_status_filter: {:enum, ["billable", "non_billable", "any"]}]
  end
end
