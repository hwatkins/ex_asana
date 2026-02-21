defmodule Asana.Budget.Request do
  @moduledoc """
  Provides struct and type for a Budget.Request
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actual: Asana.Budget.RequestActual.t() | nil,
          budget_type: String.t() | nil,
          estimate: Asana.Budget.RequestEstimate.t() | nil,
          gid: String.t() | nil,
          parent: String.t() | nil,
          resource_type: String.t() | nil,
          total: Asana.Budget.RequestTotal.t() | nil
        }

  defstruct [:__info__, :actual, :budget_type, :estimate, :gid, :parent, :resource_type, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actual: {Asana.Budget.RequestActual, :t},
      budget_type: {:enum, ["cost", "time"]},
      estimate: {Asana.Budget.RequestEstimate, :t},
      gid: :string,
      parent: :string,
      resource_type: :string,
      total: {Asana.Budget.RequestTotal, :t}
    ]
  end
end
