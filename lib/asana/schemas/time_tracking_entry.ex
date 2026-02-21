defmodule Asana.TimeTrackingEntry do
  @moduledoc """
  Provides struct and types for a TimeTrackingEntry
  """
  use Asana.Encoder

  @type base :: %__MODULE__{
          __info__: map,
          approval_status: String.t() | nil,
          attributable_to: Asana.TimeTrackingEntry.AttributableTo.base() | nil,
          billable_status: String.t() | nil,
          created_at: DateTime.t() | nil,
          created_by: Asana.User.compact() | nil,
          description: String.t() | nil,
          duration_minutes: integer | nil,
          entered_on: Date.t() | nil,
          gid: String.t() | nil,
          resource_type: String.t() | nil,
          task: Asana.Task.compact() | nil
        }

  @type compact :: %__MODULE__{
          __info__: map,
          attributable_to: Asana.TimeTrackingEntry.AttributableTo.compact() | nil,
          created_by: Asana.User.compact() | nil,
          duration_minutes: integer | nil,
          entered_on: Date.t() | nil,
          gid: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [
    :__info__,
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
  def __fields__(:base) do
    [
      approval_status: {:enum, ["DRAFT", "SUBMITTED", "APPROVED", "REJECTED"]},
      attributable_to: {Asana.TimeTrackingEntry.AttributableTo, :base},
      billable_status: {:enum, ["billable", "nonBillable", "notApplicable"]},
      created_at: {:string, "date-time"},
      created_by: {Asana.User, :compact},
      description: :string,
      duration_minutes: :integer,
      entered_on: {:string, "date"},
      gid: :string,
      resource_type: :string,
      task: {Asana.Task, :compact}
    ]
  end

  def __fields__(:compact) do
    [
      attributable_to: {Asana.TimeTrackingEntry.AttributableTo, :compact},
      created_by: {Asana.User, :compact},
      duration_minutes: :integer,
      entered_on: {:string, "date"},
      gid: :string,
      resource_type: :string
    ]
  end
end
