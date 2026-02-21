defmodule Asana.StatusUpdates do
  @moduledoc """
  Provides API endpoints related to status updates
  """

  @default_client Asana.Client

  @type create_status_for_object_201_json_resp :: %{
          __info__: map,
          data: Asana.StatusUpdate.response() | nil
        }

  @doc """
  Create a status update

  Creates a new status update on an object.
  Returns the full record of the newly created status update.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The status update to create.
  """
  @spec create_status_for_object(body :: map, opts :: keyword) ::
          {:ok, Asana.StatusUpdates.create_status_for_object_201_json_resp()}
          | {:error, Asana.Error.t()}
  def create_status_for_object(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.StatusUpdates, :create_status_for_object},
      url: "/status_updates",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.StatusUpdates, :create_status_for_object_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type delete_status_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a status update

  Deletes a specific, existing status update.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_status(status_update_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.StatusUpdates.delete_status_200_json_resp()} | {:error, Asana.Error.t()}
  def delete_status(status_update_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [status_update_gid: status_update_gid],
      call: {Asana.StatusUpdates, :delete_status},
      url: "/status_updates/#{status_update_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.StatusUpdates, :delete_status_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_status_200_json_resp :: %{__info__: map, data: Asana.StatusUpdate.response() | nil}

  @doc """
  Get a status update

  Returns the complete record for a single status update.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_status(status_update_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.StatusUpdates.get_status_200_json_resp()} | {:error, Asana.Error.t()}
  def get_status(status_update_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [status_update_gid: status_update_gid],
      call: {Asana.StatusUpdates, :get_status},
      url: "/status_updates/#{status_update_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.StatusUpdates, :get_status_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_statuses_for_object_200_json_resp :: %{
          __info__: map,
          data: [Asana.StatusUpdate.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get status updates from an object

  Returns the compact status update records for all updates on the object.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `parent`: Globally unique identifier for object to fetch statuses from. Must be a GID for a project, portfolio, or goal.
    * `created_since`: Only return statuses that have been created since the given time.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_statuses_for_object(opts :: keyword) ::
          {:ok, Asana.StatusUpdates.get_statuses_for_object_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_statuses_for_object(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:created_since, :limit, :offset, :opt_fields, :opt_pretty, :parent])

    client.request(%{
      args: [],
      call: {Asana.StatusUpdates, :get_statuses_for_object},
      url: "/status_updates",
      method: :get,
      query: query,
      response: [
        {200, {Asana.StatusUpdates, :get_statuses_for_object_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_status_for_object_201_json_resp) do
    [data: {Asana.StatusUpdate, :response}]
  end

  def __fields__(:delete_status_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_status_200_json_resp) do
    [data: {Asana.StatusUpdate, :response}]
  end

  def __fields__(:get_statuses_for_object_200_json_resp) do
    [data: [{Asana.StatusUpdate, :compact}], next_page: {Asana.NextPage, :t}]
  end
end
