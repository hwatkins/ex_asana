defmodule Asana.Generated.TimeTrackingEntries do
  @moduledoc """
  Provides API endpoints related to time tracking entries
  """

  @default_client Asana.OperationClient

  @type create_time_tracking_entry_201_json_resp :: %{
          data: Asana.Generated.TimeTrackingEntryBase.t() | nil
        }

  @doc """
  Create a time tracking entry

  Creates a time tracking entry on a given task.

  Returns the record of the newly created time tracking entry.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Information about the time tracking entry.
  """
  @spec create_time_tracking_entry(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.TimeTrackingEntries.create_time_tracking_entry_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_time_tracking_entry(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Generated.TimeTrackingEntries, :create_time_tracking_entry},
      url: "/tasks/#{task_gid}/time_tracking_entries",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.TimeTrackingEntries, :create_time_tracking_entry_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type delete_time_tracking_entry_200_json_resp :: %{data: map | nil}

  @doc """
  Delete a time tracking entry

  A specific, existing time tracking entry can be deleted by making a `DELETE` request on
  the URL for that time tracking entry.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_time_tracking_entry(time_tracking_entry_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.TimeTrackingEntries.delete_time_tracking_entry_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def delete_time_tracking_entry(time_tracking_entry_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [time_tracking_entry_gid: time_tracking_entry_gid],
      call: {Asana.Generated.TimeTrackingEntries, :delete_time_tracking_entry},
      url: "/time_tracking_entries/#{time_tracking_entry_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Generated.TimeTrackingEntries, :delete_time_tracking_entry_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_time_tracking_entries_200_json_resp :: %{
          data: [Asana.Generated.TimeTrackingEntryCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get multiple time tracking entries

  <b>Required scope: </b><code>time_tracking_entries:read</code>

  Returns a list of time tracking entries filtered to a task, attributed project, portfolio or user.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `task`: Globally unique identifier for the task to filter time tracking entries by.
    * `attributable_to`: Globally unique identifier for the project the time tracking entries are attributed to.
    * `portfolio`: Globally unique identifier for the portfolio to filter time tracking entries by.
    * `user`: Globally unique identifier for the user to filter time tracking entries by.
    * `workspace`: Globally unique identifier for the workspace. At least one of `entered_on_start_date` or `entered_on_end_date` must be provided when filtering by workspace.
    * `entered_on_start_date`: The start date for filtering time tracking entries by when they were entered.
    * `entered_on_end_date`: The end date for filtering time tracking entries by when they were entered.
    * `timesheet_approval_status`: Globally unique identifier for the timesheet approval status to filter time tracking entries by.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_time_tracking_entries(opts :: keyword) ::
          {:ok, Asana.Generated.TimeTrackingEntries.get_time_tracking_entries_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_time_tracking_entries(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :attributable_to,
        :entered_on_end_date,
        :entered_on_start_date,
        :limit,
        :offset,
        :opt_fields,
        :opt_pretty,
        :portfolio,
        :task,
        :timesheet_approval_status,
        :user,
        :workspace
      ])

    client.request(%{
      args: [],
      call: {Asana.Generated.TimeTrackingEntries, :get_time_tracking_entries},
      url: "/time_tracking_entries",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.TimeTrackingEntries, :get_time_tracking_entries_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {402, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_time_tracking_entries_for_task_200_json_resp :: %{
          data: [Asana.Generated.TimeTrackingEntryCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get time tracking entries for a task

  <b>Required scope: </b><code>time_tracking_entries:read</code>

  Returns time tracking entries for a given task.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_time_tracking_entries_for_task(task_gid :: String.t(), opts :: keyword) ::
          {:ok,
           Asana.Generated.TimeTrackingEntries.get_time_tracking_entries_for_task_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_time_tracking_entries_for_task(task_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid],
      call: {Asana.Generated.TimeTrackingEntries, :get_time_tracking_entries_for_task},
      url: "/tasks/#{task_gid}/time_tracking_entries",
      method: :get,
      query: query,
      response: [
        {200,
         {Asana.Generated.TimeTrackingEntries, :get_time_tracking_entries_for_task_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_time_tracking_entry_200_json_resp :: %{
          data: Asana.Generated.TimeTrackingEntryBase.t() | nil
        }

  @doc """
  Get a time tracking entry

  <b>Required scope: </b><code>time_tracking_entries:read</code>

  Returns the complete time tracking entry record for a single time tracking entry.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_time_tracking_entry(time_tracking_entry_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.TimeTrackingEntries.get_time_tracking_entry_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_time_tracking_entry(time_tracking_entry_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [time_tracking_entry_gid: time_tracking_entry_gid],
      call: {Asana.Generated.TimeTrackingEntries, :get_time_tracking_entry},
      url: "/time_tracking_entries/#{time_tracking_entry_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.TimeTrackingEntries, :get_time_tracking_entry_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type update_time_tracking_entry_200_json_resp :: %{
          data: Asana.Generated.TimeTrackingEntryBase.t() | nil
        }

  @doc """
  Update a time tracking entry

  A specific, existing time tracking entry can be updated by making a `PUT` request on
  the URL for that time tracking entry. Only the fields provided in the `data` block
  will be updated; any unspecified fields will remain unchanged.

  When using this method, it is best to specify only those fields you wish
  to change, or else you may overwrite changes made by another user since
  you last retrieved the task.

  Returns the complete updated time tracking entry record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the time tracking entry.
  """
  @spec update_time_tracking_entry(
          time_tracking_entry_gid :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Asana.Generated.TimeTrackingEntries.update_time_tracking_entry_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def update_time_tracking_entry(time_tracking_entry_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [time_tracking_entry_gid: time_tracking_entry_gid, body: body],
      call: {Asana.Generated.TimeTrackingEntries, :update_time_tracking_entry},
      url: "/time_tracking_entries/#{time_tracking_entry_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.TimeTrackingEntries, :update_time_tracking_entry_200_json_resp}},
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
  def __fields__(:create_time_tracking_entry_201_json_resp) do
    [data: {Asana.Generated.TimeTrackingEntryBase, :t}]
  end

  def __fields__(:delete_time_tracking_entry_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_time_tracking_entries_200_json_resp) do
    [
      data: [{Asana.Generated.TimeTrackingEntryCompact, :t}],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end

  def __fields__(:get_time_tracking_entries_for_task_200_json_resp) do
    [
      data: [{Asana.Generated.TimeTrackingEntryCompact, :t}],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end

  def __fields__(:get_time_tracking_entry_200_json_resp) do
    [data: {Asana.Generated.TimeTrackingEntryBase, :t}]
  end

  def __fields__(:update_time_tracking_entry_200_json_resp) do
    [data: {Asana.Generated.TimeTrackingEntryBase, :t}]
  end
end
