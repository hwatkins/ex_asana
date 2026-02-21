defmodule Asana.Generated.CustomFieldCreateRequestDateValue do
  @moduledoc """
  Provides struct and type for a CustomFieldCreateRequestDateValue
  """

  @type t :: %__MODULE__{date: String.t() | nil, date_time: String.t() | nil}

  defstruct [:date, :date_time]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date: :string, date_time: :string]
  end
end
