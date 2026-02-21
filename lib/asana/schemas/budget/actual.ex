defmodule Asana.Budget.Actual do
  @moduledoc """
  Provides struct and type for a Budget.Actual
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          billable_status_filter: String.t() | nil,
          units: String.t() | nil,
          value: number | nil
        }

  defstruct [:__info__, :billable_status_filter, :units, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      billable_status_filter: {:enum, ["billable", "non_billable", "any"]},
      units: :string,
      value: :number
    ]
  end
end
