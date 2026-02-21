defmodule Asana.Generated.StoryResponseDates do
  @moduledoc """
  Provides struct and type for a StoryResponseDates
  """

  @type t :: %__MODULE__{
          due_at: DateTime.t() | nil,
          due_on: Date.t() | nil,
          start_on: Date.t() | nil
        }

  defstruct [:due_at, :due_on, :start_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [due_at: {:string, "date-time"}, due_on: {:string, "date"}, start_on: {:string, "date"}]
  end
end
