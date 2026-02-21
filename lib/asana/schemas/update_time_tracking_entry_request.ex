defmodule Asana.UpdateTimeTrackingEntryRequest do
  @moduledoc """
  Provides struct and type for a UpdateTimeTrackingEntryRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          attributable_to: String.t() | nil,
          billable_status: String.t() | nil,
          description: String.t() | nil,
          duration_minutes: integer | nil,
          entered_on: Date.t() | nil
        }

  defstruct [
    :__info__,
    :attributable_to,
    :billable_status,
    :description,
    :duration_minutes,
    :entered_on
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributable_to: :string,
      billable_status: {:enum, ["billable", "nonBillable", "notApplicable"]},
      description: :string,
      duration_minutes: :integer,
      entered_on: {:string, "date"}
    ]
  end
end
