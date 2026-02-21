defmodule Asana.Generated.BudgetResponse do
  @moduledoc """
  Provides struct and type for a BudgetResponse
  """

  @type t :: %__MODULE__{
          actual: Asana.Generated.BudgetResponseActual.t() | nil,
          budget_type: String.t() | nil,
          estimate: Asana.Generated.BudgetResponseEstimate.t() | nil,
          gid: String.t() | nil,
          parent: Asana.Generated.BudgetResponseParent.t() | nil,
          resource_type: String.t() | nil,
          total: Asana.Generated.BudgetResponseTotal.t() | nil
        }

  defstruct [:actual, :budget_type, :estimate, :gid, :parent, :resource_type, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actual: {Asana.Generated.BudgetResponseActual, :t},
      budget_type: {:enum, ["cost", "time"]},
      estimate: {Asana.Generated.BudgetResponseEstimate, :t},
      gid: :string,
      parent: {Asana.Generated.BudgetResponseParent, :t},
      resource_type: :string,
      total: {Asana.Generated.BudgetResponseTotal, :t}
    ]
  end
end
