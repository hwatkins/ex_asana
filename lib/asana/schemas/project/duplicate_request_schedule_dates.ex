defmodule Asana.Project.DuplicateRequestScheduleDates do
  @moduledoc """
  Provides struct and type for a Project.DuplicateRequestScheduleDates
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          due_on: String.t() | nil,
          should_skip_weekends: boolean | nil,
          start_on: String.t() | nil
        }

  defstruct [:__info__, :due_on, :should_skip_weekends, :start_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [due_on: :string, should_skip_weekends: :boolean, start_on: :string]
  end
end
