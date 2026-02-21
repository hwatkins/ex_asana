defmodule Asana.Generated.Workspaces do
  @moduledoc """
  Provides API endpoints related to workspaces
  """

  @default_client Asana.OperationClient

  @type add_user_for_workspace_200_json_resp :: %{
          data: Asana.Generated.UserBaseResponse.t() | nil
        }

  @doc """
  Add a user to a workspace or organization

  Add a user to a workspace or organization.
  The user can be referenced by their globally unique user ID or their email address. Returns the full user record for the invited user.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The user to add to the workspace.
  """
  @spec add_user_for_workspace(workspace_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Workspaces.add_user_for_workspace_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def add_user_for_workspace(workspace_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid, body: body],
      call: {Asana.Generated.Workspaces, :add_user_for_workspace},
      url: "/workspaces/#{workspace_gid}/addUser",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Workspaces, :add_user_for_workspace_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_workspace_200_json_resp :: %{data: Asana.Generated.WorkspaceResponse.t() | nil}

  @doc """
  Get a workspace

  <b>Required scope: </b><code>workspaces:read</code>

  Returns the full workspace record for a single workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_workspace(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Workspaces.get_workspace_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_workspace(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.Generated.Workspaces, :get_workspace},
      url: "/workspaces/#{workspace_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Workspaces, :get_workspace_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_workspace_events_200_json_resp :: %{
          data: [Asana.Generated.EventResponse.t()] | nil,
          has_more: boolean | nil,
          sync: String.t() | nil
        }

  @doc """
  Get workspace events

  Returns the full record for all events that have occurred since the sync token was created.
  The response is a list of events and the schema of each event is as described [here](/reference/events).
  Asana limits a single sync token to 1000 events. If more than 1000 events exist for a given domain, `has_more: true` will be returned in the response, indicating that there are more events to pull.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `sync`: A sync token received from the last request, or none on first sync. Events will be returned from the point in time that the sync token was generated.
      *Note: On your first request, omit the sync token. The response will be the same as for an expired sync token, and will include a new valid sync token. If the sync token is too old (which may happen from time to time) the API will return a `412 Precondition Failed` error, and include a fresh sync token in the response.*

  """
  @spec get_workspace_events(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Workspaces.get_workspace_events_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_workspace_events(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty, :sync])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.Generated.Workspaces, :get_workspace_events},
      url: "/workspaces/#{workspace_gid}/events",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Workspaces, :get_workspace_events_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_workspaces_200_json_resp :: %{
          data: [Asana.Generated.WorkspaceCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get multiple workspaces

  <b>Required scope: </b><code>workspaces:read</code>

  Returns the compact records for all workspaces visible to the authorized user.

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
  @spec get_workspaces(opts :: keyword) ::
          {:ok, Asana.Generated.Workspaces.get_workspaces_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_workspaces(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [],
      call: {Asana.Generated.Workspaces, :get_workspaces},
      url: "/workspaces",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Workspaces, :get_workspaces_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type remove_user_for_workspace_200_json_resp :: %{data: map | nil}

  @doc """
  Remove a user from a workspace or organization

  Remove a user from a workspace or organization.

  The user making this call must be an admin in the workspace. The user can
  be referenced by their globally unique user ID or their email address.

  When invoked using a **Service Account Token (SAT)**, this endpoint follows the same behavior as the
  [SCIM API Delete endpoint](/docs/scim).
  To learn more about how Asana handles user deprovisioning, refer to our
  [Help Center article on deprovisioning users](https://help.asana.com/s/article/user-deprovisioning).

  When invoked using a **Personal Access Token (PAT)**, the endpoint behaves similarly, except that
  ownership of the user’s resources is transferred to the **PAT owner** instead of the admin
  [specified in the Admin Console](https://help.asana.com/s/article/user-deprovisioning#gl-deprovisioning).

  **Note:** If you wish to retain access to a user’s private resources
  (i.e., those visible only to that user), you have to make them public manually
  (or ask the user to do so) before removal.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The user to remove from the workspace.
  """
  @spec remove_user_for_workspace(workspace_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Workspaces.remove_user_for_workspace_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def remove_user_for_workspace(workspace_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid, body: body],
      call: {Asana.Generated.Workspaces, :remove_user_for_workspace},
      url: "/workspaces/#{workspace_gid}/removeUser",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Workspaces, :remove_user_for_workspace_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type update_workspace_200_json_resp :: %{data: Asana.Generated.WorkspaceResponse.t() | nil}

  @doc """
  Update a workspace

  A specific, existing workspace can be updated by making a PUT request on the URL for that workspace. Only the fields provided in the data block will be updated; any unspecified fields will remain unchanged.
  Currently the only field that can be modified for a workspace is its name.
  Returns the complete, updated workspace record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The workspace object with all updated properties.
  """
  @spec update_workspace(workspace_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Workspaces.update_workspace_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def update_workspace(workspace_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid, body: body],
      call: {Asana.Generated.Workspaces, :update_workspace},
      url: "/workspaces/#{workspace_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Workspaces, :update_workspace_200_json_resp}},
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
  def __fields__(:add_user_for_workspace_200_json_resp) do
    [data: {Asana.Generated.UserBaseResponse, :t}]
  end

  def __fields__(:get_workspace_200_json_resp) do
    [data: {Asana.Generated.WorkspaceResponse, :t}]
  end

  def __fields__(:get_workspace_events_200_json_resp) do
    [data: [{Asana.Generated.EventResponse, :t}], has_more: :boolean, sync: :string]
  end

  def __fields__(:get_workspaces_200_json_resp) do
    [data: [{Asana.Generated.WorkspaceCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end

  def __fields__(:remove_user_for_workspace_200_json_resp) do
    [data: :map]
  end

  def __fields__(:update_workspace_200_json_resp) do
    [data: {Asana.Generated.WorkspaceResponse, :t}]
  end
end
