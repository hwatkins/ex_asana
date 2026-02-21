defmodule Asana.Story.OldDateValue do
  @moduledoc """
  Provides struct and type for a Story.OldDateValue
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          due_at: DateTime.t() | nil,
          due_on: Date.t() | nil,
          start_on: Date.t() | nil
        }

  defstruct [:__info__, :due_at, :due_on, :start_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [due_at: {:string, "date-time"}, due_on: {:string, "date"}, start_on: {:string, "date"}]
  end
end
