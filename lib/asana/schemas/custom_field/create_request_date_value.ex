defmodule Asana.CustomField.CreateRequestDateValue do
  @moduledoc """
  Provides struct and type for a CustomField.CreateRequestDateValue
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, date: String.t() | nil, date_time: String.t() | nil}

  defstruct [:__info__, :date, :date_time]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date: :string, date_time: :string]
  end
end
