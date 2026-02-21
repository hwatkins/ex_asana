defmodule Asana.Project.DuplicateRequest do
  @moduledoc """
  Provides struct and type for a Project.DuplicateRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          include: String.t() | nil,
          name: String.t(),
          schedule_dates: Asana.Project.DuplicateRequestScheduleDates.t() | nil,
          team: String.t() | nil
        }

  defstruct [:__info__, :include, :name, :schedule_dates, :team]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      include: :string,
      name: :string,
      schedule_dates: {Asana.Project.DuplicateRequestScheduleDates, :t},
      team: :string
    ]
  end
end
