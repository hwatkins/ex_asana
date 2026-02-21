defmodule Asana.Generated.BudgetRequest do
  @moduledoc """
  Provides struct and type for a BudgetRequest
  """

  @type t :: %__MODULE__{
          actual: Asana.Generated.BudgetRequestActual.t() | nil,
          budget_type: String.t() | nil,
          estimate: Asana.Generated.BudgetRequestEstimate.t() | nil,
          gid: String.t() | nil,
          parent: String.t() | nil,
          resource_type: String.t() | nil,
          total: Asana.Generated.BudgetRequestTotal.t() | nil
        }

  defstruct [:actual, :budget_type, :estimate, :gid, :parent, :resource_type, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actual: {Asana.Generated.BudgetRequestActual, :t},
      budget_type: {:enum, ["cost", "time"]},
      estimate: {Asana.Generated.BudgetRequestEstimate, :t},
      gid: :string,
      parent: :string,
      resource_type: :string,
      total: {Asana.Generated.BudgetRequestTotal, :t}
    ]
  end
end
