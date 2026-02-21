defmodule Asana.Generated.AuditLogEvent do
  @moduledoc """
  Provides struct and type for a AuditLogEvent
  """

  @type t :: %__MODULE__{
          actor: Asana.Generated.AuditLogEventActor.t() | nil,
          context: Asana.Generated.AuditLogEventContext.t() | nil,
          created_at: DateTime.t() | nil,
          details: Asana.Generated.AuditLogEventDetails.t() | nil,
          event_category: String.t() | nil,
          event_type: String.t() | nil,
          gid: String.t() | nil,
          resource: Asana.Generated.AuditLogEventResource.t() | nil
        }

  defstruct [
    :actor,
    :context,
    :created_at,
    :details,
    :event_category,
    :event_type,
    :gid,
    :resource
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {Asana.Generated.AuditLogEventActor, :t},
      context: {Asana.Generated.AuditLogEventContext, :t},
      created_at: {:string, "date-time"},
      details: {Asana.Generated.AuditLogEventDetails, :t},
      event_category: :string,
      event_type: :string,
      gid: :string,
      resource: {Asana.Generated.AuditLogEventResource, :t}
    ]
  end
end
