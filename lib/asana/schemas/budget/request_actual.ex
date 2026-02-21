defmodule Asana.Budget.RequestActual do
  @moduledoc """
  Provides struct and type for a Budget.RequestActual
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, billable_status_filter: String.t() | nil}

  defstruct [:__info__, :billable_status_filter]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable_status_filter: {:enum, ["billable", "non_billable", "any"]}]
  end
end
