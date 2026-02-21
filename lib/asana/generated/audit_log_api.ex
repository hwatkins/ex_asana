defmodule Asana.Generated.AuditLogAPI do
  @moduledoc """
  Provides API endpoint related to audit log api
  """

  @default_client Asana.OperationClient

  @type get_audit_log_events_200_json_resp :: %{
          data: [Asana.Generated.AuditLogEvent.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get audit log events

  Retrieve the audit log events that have been captured in your domain.

  This endpoint will return a list of [AuditLogEvent](/reference/audit-log-api) objects, sorted by creation time in ascending order. Note that the Audit Log API captures events from October 8th, 2021 and later. Queries for events before this date will not return results.

  There are a number of query parameters (below) that can be used to filter the set of [AuditLogEvent](/reference/audit-log-api) objects that are returned in the response. Any combination of query parameters is valid. When no filters are provided, all of the events that have been captured in your domain will match.

  The list of events will always be [paginated](/docs/pagination). The default limit is 1000 events. The next set of events can be retrieved using the `offset` from the previous response. If there are no events that match the provided filters in your domain, the endpoint will return `null` for the `next_page` field. Querying again with the same filters may return new events if they were captured after the last request. Once a response includes a `next_page` with an `offset`, subsequent requests can be made with the latest `offset` to poll for new events that match the provided filters.

  *Note: If the filters you provided match events in your domain and `next_page` is present in the response, we will continue to send `next_page` on subsequent requests even when there are no more events that match the filters. This was put in place so that you can implement an audit log stream that will return future events that match these filters. If you are not interested in future events that match the filters you have defined, you can rely on checking empty `data` response for the end of current events that match your filters.*

  When no `offset` is provided, the response will begin with the oldest events that match the provided filters. It is important to note that [AuditLogEvent](/reference/audit-log-api) objects will be permanently deleted from our systems after 90 days. If you wish to keep a permanent record of these events, we recommend using a SIEM tool to ingest and store these logs.

  ## Options

    * `start_at`: Filter to events created after this time (inclusive).
    * `end_at`: Filter to events created before this time (exclusive).
    * `event_type`: Filter to events of this type.
      Refer to the [supported audit log events](/docs/audit-log-events#supported-audit-log-events) for a full list of values.
    * `actor_type`: Filter to events with an actor of this type.
      This only needs to be included if querying for actor types without an ID. If `actor_gid` is included, this should be excluded.
    * `actor_gid`: Filter to events triggered by the actor with this ID.
    * `resource_gid`: Filter to events with this resource ID.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*

  """
  @spec get_audit_log_events(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.AuditLogAPI.get_audit_log_events_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_audit_log_events(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :actor_gid,
        :actor_type,
        :end_at,
        :event_type,
        :limit,
        :offset,
        :resource_gid,
        :start_at
      ])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.Generated.AuditLogAPI, :get_audit_log_events},
      url: "/workspaces/#{workspace_gid}/audit_log_events",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.AuditLogAPI, :get_audit_log_events_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_audit_log_events_200_json_resp) do
    [data: [{Asana.Generated.AuditLogEvent, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end
end
