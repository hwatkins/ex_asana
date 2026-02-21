defmodule Asana.Budget do
  @moduledoc """
  Provides struct and type for a Budget
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          actual: Asana.Budget.Actual.response() | nil,
          budget_type: String.t() | nil,
          estimate: Asana.Budget.Estimate.response() | nil,
          gid: String.t() | nil,
          parent: Asana.Budget.Parent.response() | nil,
          resource_type: String.t() | nil,
          total: Asana.Budget.Total.response() | nil
        }

  defstruct [:__info__, :actual, :budget_type, :estimate, :gid, :parent, :resource_type, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      actual: {Asana.Budget.Actual, :response},
      budget_type: {:enum, ["cost", "time"]},
      estimate: {Asana.Budget.Estimate, :response},
      gid: :string,
      parent: {Asana.Budget.Parent, :response},
      resource_type: :string,
      total: {Asana.Budget.Total, :response}
    ]
  end
end
