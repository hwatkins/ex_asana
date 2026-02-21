defmodule Asana.Budget.RequestTotal do
  @moduledoc """
  Provides struct and type for a Budget.RequestTotal
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, enabled: boolean | nil, value: number | nil}

  defstruct [:__info__, :enabled, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean, value: :number]
  end
end
