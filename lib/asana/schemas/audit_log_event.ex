defmodule Asana.AuditLogEvent do
  @moduledoc """
  Provides struct and type for a AuditLogEvent
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actor: Asana.AuditLogEvent.Actor.t() | nil,
          context: Asana.AuditLogEvent.Context.t() | nil,
          created_at: DateTime.t() | nil,
          details: Asana.AuditLogEvent.Details.t() | nil,
          event_category: String.t() | nil,
          event_type: String.t() | nil,
          gid: String.t() | nil,
          resource: Asana.AuditLogEvent.Resource.t() | nil
        }

  defstruct [
    :__info__,
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
      actor: {Asana.AuditLogEvent.Actor, :t},
      context: {Asana.AuditLogEvent.Context, :t},
      created_at: {:string, "date-time"},
      details: {Asana.AuditLogEvent.Details, :t},
      event_category: :string,
      event_type: :string,
      gid: :string,
      resource: {Asana.AuditLogEvent.Resource, :t}
    ]
  end
end
