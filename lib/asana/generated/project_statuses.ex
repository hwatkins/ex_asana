defmodule Asana.Generated.ProjectStatuses do
  @moduledoc """
  Provides API endpoints related to project statuses
  """

  @default_client Asana.OperationClient

  @type create_project_status_for_project_201_json_resp :: %{
          data: Asana.Generated.ProjectStatusResponse.t() | nil
        }

  @doc """
  Create a project status

  *Deprecated: new integrations should prefer the `/status_updates` route.*

  Creates a new status update on the project.

  Returns the full record of the newly created project status update.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The project status to create.
  """
  @spec create_project_status_for_project(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.ProjectStatuses.create_project_status_for_project_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_project_status_for_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.ProjectStatuses, :create_project_status_for_project},
      url: "/projects/#{project_gid}/project_statuses",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201,
         {Asana.Generated.ProjectStatuses, :create_project_status_for_project_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type delete_project_status_200_json_resp :: %{data: map | nil}

  @doc """
  Delete a project status

  *Deprecated: new integrations should prefer the `/status_updates/{status_gid}` route.*

  Deletes a specific, existing project status update.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_project_status(project_status_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.ProjectStatuses.delete_project_status_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def delete_project_status(project_status_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [project_status_gid: project_status_gid],
      call: {Asana.Generated.ProjectStatuses, :delete_project_status},
      url: "/project_statuses/#{project_status_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Generated.ProjectStatuses, :delete_project_status_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_project_status_200_json_resp :: %{
          data: Asana.Generated.ProjectStatusResponse.t() | nil
        }

  @doc """
  Get a project status

  *Deprecated: new integrations should prefer the `/status_updates/{status_gid}` route.*

  Returns the complete record for a single status update.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_project_status(project_status_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.ProjectStatuses.get_project_status_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_project_status(project_status_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_status_gid: project_status_gid],
      call: {Asana.Generated.ProjectStatuses, :get_project_status},
      url: "/project_statuses/#{project_status_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.ProjectStatuses, :get_project_status_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_project_statuses_for_project_200_json_resp :: %{
          data: [Asana.Generated.ProjectStatusCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get statuses from a project

  *Deprecated: new integrations should prefer the `/status_updates` route.*

  Returns the compact project status update records for all updates on the project.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_project_statuses_for_project(
          project_gid :: String.t(),
          project_gid :: String.t(),
          opts :: keyword
        ) ::
          {:ok, Asana.Generated.ProjectStatuses.get_project_statuses_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_project_statuses_for_project(project_gid, project_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, project_gid: project_gid],
      call: {Asana.Generated.ProjectStatuses, :get_project_statuses_for_project},
      url: "/projects/#{project_gid}/project_statuses",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.ProjectStatuses, :get_project_statuses_for_project_200_json_resp}},
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
  def __fields__(:create_project_status_for_project_201_json_resp) do
    [data: {Asana.Generated.ProjectStatusResponse, :t}]
  end

  def __fields__(:delete_project_status_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_project_status_200_json_resp) do
    [data: {Asana.Generated.ProjectStatusResponse, :t}]
  end

  def __fields__(:get_project_statuses_for_project_200_json_resp) do
    [
      data: [{Asana.Generated.ProjectStatusCompact, :t}],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end
end
