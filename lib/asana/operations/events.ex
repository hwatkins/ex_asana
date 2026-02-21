defmodule Asana.Events do
  @moduledoc """
  Provides API endpoint related to events
  """

  @default_client Asana.Client

  @type get_events_200_json_resp :: %{
          __info__: map,
          data: [Asana.Event.response()] | nil,
          has_more: boolean | nil,
          sync: String.t() | nil
        }

  @type get_events_412_json_resp :: %{
          __info__: map,
          errors: [Asana.Events.get_events_412_json_resp_errors()] | nil,
          sync: String.t() | nil
        }

  @type get_events_412_json_resp_errors :: %{__info__: map, message: String.t() | nil}

  @doc """
  Get events on a resource

  Returns the full record for all events that have occurred since the sync
  token was created.

  A `GET` request to the endpoint `/[path_to_resource]/events` can be made in
  lieu of including the resource ID in the data for the request.

  Asana limits a single sync token to 100 events. If more than 100 events exist
  for a given resource, `has_more: true` will be returned in the response, indicating
  that there are more events to pull.

  *Note: The resource returned will be the resource that triggered the
  event. This may be different from the one that the events were requested
  for. For example, a subscription to a project will contain events for
  tasks contained within the project.*

  ## Options

    * `resource`: A resource ID to subscribe to. The resource can be a task, project, or goal.
    * `sync`: A sync token received from the last request, or none on first sync. Events will be returned from the point in time that the sync token was generated.
      *Note: On your first request, omit the sync token. The response will be the same as for an expired sync token, and will include a new valid sync token.If the sync token is too old (which may happen from time to time) the API will return a `412 Precondition Failed` error, and include a fresh sync token in the response.*
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_events(opts :: keyword) ::
          {:ok, Asana.Events.get_events_200_json_resp()} | {:error, Asana.Error.t()}
  def get_events(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty, :resource, :sync])

    client.request(%{
      args: [],
      call: {Asana.Events, :get_events},
      url: "/events",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Events, :get_events_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {412, {Asana.Events, :get_events_412_json_resp}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_events_200_json_resp) do
    [data: [{Asana.Event, :response}], has_more: :boolean, sync: :string]
  end

  def __fields__(:get_events_412_json_resp) do
    [errors: [{Asana.Events, :get_events_412_json_resp_errors}], sync: :string]
  end

  def __fields__(:get_events_412_json_resp_errors) do
    [message: :string]
  end
end
