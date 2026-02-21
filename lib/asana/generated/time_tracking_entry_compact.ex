defmodule Asana.Generated.TimeTrackingEntryCompact do
  @moduledoc """
  Provides struct and type for a TimeTrackingEntryCompact
  """

  @type t :: %__MODULE__{
          attributable_to: Asana.Generated.TimeTrackingEntryCompactAttributableTo.t() | nil,
          created_by: Asana.Generated.UserCompact.t() | nil,
          duration_minutes: integer | nil,
          entered_on: Date.t() | nil,
          gid: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:attributable_to, :created_by, :duration_minutes, :entered_on, :gid, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributable_to: {Asana.Generated.TimeTrackingEntryCompactAttributableTo, :t},
      created_by: {Asana.Generated.UserCompact, :t},
      duration_minutes: :integer,
      entered_on: {:string, "date"},
      gid: :string,
      resource_type: :string
    ]
  end
end
