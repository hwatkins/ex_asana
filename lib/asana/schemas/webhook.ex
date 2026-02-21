defmodule Asana.Webhook do
  @moduledoc """
  Provides struct and type for a Webhook
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          active: boolean | nil,
          created_at: DateTime.t() | nil,
          delivery_retry_count: integer | nil,
          failure_deletion_timestamp: DateTime.t() | nil,
          filters: [Asana.Webhook.Filters.response()] | nil,
          gid: String.t() | nil,
          last_failure_at: DateTime.t() | nil,
          last_failure_content: String.t() | nil,
          last_success_at: DateTime.t() | nil,
          next_attempt_after: DateTime.t() | nil,
          resource: Asana.AsanaNamedResource.t() | nil,
          resource_type: String.t() | nil,
          target: String.t() | nil
        }

  defstruct [
    :__info__,
    :active,
    :created_at,
    :delivery_retry_count,
    :failure_deletion_timestamp,
    :filters,
    :gid,
    :last_failure_at,
    :last_failure_content,
    :last_success_at,
    :next_attempt_after,
    :resource,
    :resource_type,
    :target
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      active: :boolean,
      created_at: {:string, "date-time"},
      delivery_retry_count: :integer,
      failure_deletion_timestamp: {:string, "date-time"},
      filters: [{Asana.Webhook.Filters, :response}],
      gid: :string,
      last_failure_at: {:string, "date-time"},
      last_failure_content: :string,
      last_success_at: {:string, "date-time"},
      next_attempt_after: {:string, "date-time"},
      resource: {Asana.AsanaNamedResource, :t},
      resource_type: :string,
      target: {:string, "uri"}
    ]
  end
end
