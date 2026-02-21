defmodule Asana.Generated.ProjectDuplicateRequest do
  @moduledoc """
  Provides struct and type for a ProjectDuplicateRequest
  """

  @type t :: %__MODULE__{
          include: String.t() | nil,
          name: String.t(),
          schedule_dates: Asana.Generated.ProjectDuplicateRequestScheduleDates.t() | nil,
          team: String.t() | nil
        }

  defstruct [:include, :name, :schedule_dates, :team]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      include: :string,
      name: :string,
      schedule_dates: {Asana.Generated.ProjectDuplicateRequestScheduleDates, :t},
      team: :string
    ]
  end
end
