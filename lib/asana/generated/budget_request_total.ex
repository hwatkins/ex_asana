defmodule Asana.Generated.BudgetRequestTotal do
  @moduledoc """
  Provides struct and type for a BudgetRequestTotal
  """

  @type t :: %__MODULE__{enabled: boolean | nil, value: number | nil}

  defstruct [:enabled, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean, value: :number]
  end
end
