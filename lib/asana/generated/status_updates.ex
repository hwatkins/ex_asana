defmodule Asana.Generated.StatusUpdates do
  @moduledoc """
  Provides API endpoints related to status updates
  """

  @default_client Asana.OperationClient

  @type create_status_for_object_201_json_resp :: %{
          data: Asana.Generated.StatusUpdateResponse.t() | nil
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
          {:ok, Asana.Generated.StatusUpdates.create_status_for_object_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_status_for_object(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Generated.StatusUpdates, :create_status_for_object},
      url: "/status_updates",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.StatusUpdates, :create_status_for_object_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type delete_status_200_json_resp :: %{data: map | nil}

  @doc """
  Delete a status update

  Deletes a specific, existing status update.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_status(status_update_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.StatusUpdates.delete_status_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def delete_status(status_update_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [status_update_gid: status_update_gid],
      call: {Asana.Generated.StatusUpdates, :delete_status},
      url: "/status_updates/#{status_update_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Generated.StatusUpdates, :delete_status_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_status_200_json_resp :: %{data: Asana.Generated.StatusUpdateResponse.t() | nil}

  @doc """
  Get a status update

  Returns the complete record for a single status update.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_status(status_update_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.StatusUpdates.get_status_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_status(status_update_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [status_update_gid: status_update_gid],
      call: {Asana.Generated.StatusUpdates, :get_status},
      url: "/status_updates/#{status_update_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.StatusUpdates, :get_status_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_statuses_for_object_200_json_resp :: %{
          data: [Asana.Generated.StatusUpdateCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
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
          {:ok, Asana.Generated.StatusUpdates.get_statuses_for_object_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_statuses_for_object(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:created_since, :limit, :offset, :opt_fields, :opt_pretty, :parent])

    client.request(%{
      args: [],
      call: {Asana.Generated.StatusUpdates, :get_statuses_for_object},
      url: "/status_updates",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.StatusUpdates, :get_statuses_for_object_200_json_resp}},
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
  def __fields__(:create_status_for_object_201_json_resp) do
    [data: {Asana.Generated.StatusUpdateResponse, :t}]
  end

  def __fields__(:delete_status_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_status_200_json_resp) do
    [data: {Asana.Generated.StatusUpdateResponse, :t}]
  end

  def __fields__(:get_statuses_for_object_200_json_resp) do
    [data: [{Asana.Generated.StatusUpdateCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end
end
