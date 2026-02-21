defmodule Asana.Budget.Total do
  @moduledoc """
  Provides struct and type for a Budget.Total
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          enabled: boolean | nil,
          units: String.t() | nil,
          value: number | nil
        }

  defstruct [:__info__, :enabled, :units, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [enabled: :boolean, units: :string, value: :number]
  end
end
