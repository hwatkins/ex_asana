defmodule Asana.Generated.TimeTrackingEntryBase do
  @moduledoc """
  Provides struct and type for a TimeTrackingEntryBase
  """

  @type t :: %__MODULE__{
          approval_status: String.t() | nil,
          attributable_to: Asana.Generated.TimeTrackingEntryBaseAttributableTo.t() | nil,
          billable_status: String.t() | nil,
          created_at: DateTime.t() | nil,
          created_by: Asana.Generated.UserCompact.t() | nil,
          description: String.t() | nil,
          duration_minutes: integer | nil,
          entered_on: Date.t() | nil,
          gid: String.t() | nil,
          resource_type: String.t() | nil,
          task: Asana.Generated.TaskCompact.t() | nil
        }

  defstruct [
    :approval_status,
    :attributable_to,
    :billable_status,
    :created_at,
    :created_by,
    :description,
    :duration_minutes,
    :entered_on,
    :gid,
    :resource_type,
    :task
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      approval_status: {:enum, ["DRAFT", "SUBMITTED", "APPROVED", "REJECTED"]},
      attributable_to: {Asana.Generated.TimeTrackingEntryBaseAttributableTo, :t},
      billable_status: {:enum, ["billable", "nonBillable", "notApplicable"]},
      created_at: {:string, "date-time"},
      created_by: {Asana.Generated.UserCompact, :t},
      description: :string,
      duration_minutes: :integer,
      entered_on: {:string, "date"},
      gid: :string,
      resource_type: :string,
      task: {Asana.Generated.TaskCompact, :t}
    ]
  end
end
