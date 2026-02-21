defmodule Asana.Generated.BudgetResponseTotal do
  @moduledoc """
  Provides struct and type for a BudgetResponseTotal
  """

  @type t :: %__MODULE__{enabled: boolean | nil, units: String.t() | nil, value: number | nil}

  defstruct [:enabled, :units, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean, units: :string, value: :number]
  end
end
