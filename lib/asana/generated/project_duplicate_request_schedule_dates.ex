defmodule Asana.Generated.ProjectDuplicateRequestScheduleDates do
  @moduledoc """
  Provides struct and type for a ProjectDuplicateRequestScheduleDates
  """

  @type t :: %__MODULE__{
          due_on: String.t() | nil,
          should_skip_weekends: boolean | nil,
          start_on: String.t() | nil
        }

  defstruct [:due_on, :should_skip_weekends, :start_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [due_on: :string, should_skip_weekends: :boolean, start_on: :string]
  end
end
