defmodule Asana.CustomField.DateValue do
  @moduledoc """
  Provides struct and type for a CustomField.DateValue
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{__info__: map, date: String.t() | nil, date_time: String.t() | nil}

  defstruct [:__info__, :date, :date_time]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [date: :string, date_time: :string]
  end
end
