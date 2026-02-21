defmodule Asana.Users do
  @moduledoc """
  Provides API endpoints related to users
  """

  @default_client Asana.Client

  @type get_favorites_for_user_200_json_resp :: %{
          __info__: map,
          data: [Asana.AsanaNamedResource.t()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get a user's favorites

  <b>Required scope: </b><code>users:read</code>

  Returns all of a user's favorites within a specified workspace and of a given type. The results are ordered exactly as they appear in the user's Asana sidebar in the web application. Note that this endpoint currently only returns favorites for the current user (i.e., the user associated with the authentication token).

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `resource_type`: The resource type of favorites to be returned.
    * `workspace`: The workspace in which to get favorites.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_favorites_for_user(user_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Users.get_favorites_for_user_200_json_resp()} | {:error, Asana.Error.t()}
  def get_favorites_for_user(user_gid, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :resource_type, :workspace])

    client.request(%{
      args: [user_gid: user_gid],
      call: {Asana.Users, :get_favorites_for_user},
      url: "/users/#{user_gid}/favorites",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Users, :get_favorites_for_user_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_user_200_json_resp :: %{__info__: map, data: Asana.User.response() | nil}

  @doc """
  Get a user

  <b>Required scope: </b><code>users:read</code>

  Returns the full user record for the single user with the provided ID.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `workspace`: The workspace to filter results on.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_user(user_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Users.get_user_200_json_resp()} | {:error, Asana.Error.t()}
  def get_user(user_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty, :workspace])

    client.request(%{
      args: [user_gid: user_gid],
      call: {Asana.Users, :get_user},
      url: "/users/#{user_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Users, :get_user_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_user_for_workspace_200_json_resp :: %{
          __info__: map,
          data: Asana.User.response() | nil
        }

  @doc """
  Get a user in a workspace or organization

  <b>Required scope: </b><code>users:read</code>

  Returns the full user record for the single user with the provided ID in the specified workspace or organization.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_user_for_workspace(
          workspace_gid :: String.t(),
          user_gid :: String.t(),
          opts :: keyword
        ) :: {:ok, Asana.Users.get_user_for_workspace_200_json_resp()} | {:error, Asana.Error.t()}
  def get_user_for_workspace(workspace_gid, user_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid, user_gid: user_gid],
      call: {Asana.Users, :get_user_for_workspace},
      url: "/workspaces/#{workspace_gid}/users/#{user_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Users, :get_user_for_workspace_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_users_200_json_resp :: %{
          __info__: map,
          data: [Asana.User.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get multiple users

  <b>Required scope: </b><code>users:read</code>

  Returns the user records for all users in all workspaces and organizations accessible to the authenticated user. Accepts an optional workspace ID parameter.
  Results are sorted by user ID.

  ## Options

    * `workspace`: The workspace or organization ID to filter users on.
    * `team`: The team ID to filter users on.
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_users(opts :: keyword) ::
          {:ok, Asana.Users.get_users_200_json_resp()} | {:error, Asana.Error.t()}
  def get_users(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :team, :workspace])

    client.request(%{
      args: [],
      call: {Asana.Users, :get_users},
      url: "/users",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Users, :get_users_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_users_for_team_200_json_resp :: %{__info__: map, data: [Asana.User.compact()] | nil}

  @doc """
  Get users in a team

  <b>Required scope: </b><code>users:read</code>

  Returns the compact records for all users that are members of the team.
  Results are sorted alphabetically and limited to 2000. For more results use the `/users` endpoint.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_users_for_team(team_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Users.get_users_for_team_200_json_resp()} | {:error, Asana.Error.t()}
  def get_users_for_team(team_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [team_gid: team_gid],
      call: {Asana.Users, :get_users_for_team},
      url: "/teams/#{team_gid}/users",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Users, :get_users_for_team_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_users_for_workspace_200_json_resp :: %{
          __info__: map,
          data: [Asana.User.compact()] | nil
        }

  @doc """
  Get users in a workspace or organization

  <b>Required scope: </b><code>users:read</code>

  Returns the compact records for all users in the specified workspace or organization.
  Results are sorted alphabetically and limited to 2000. For more results use the `/users` endpoint.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_users_for_workspace(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Users.get_users_for_workspace_200_json_resp()} | {:error, Asana.Error.t()}
  def get_users_for_workspace(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.Users, :get_users_for_workspace},
      url: "/workspaces/#{workspace_gid}/users",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Users, :get_users_for_workspace_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_user_200_json_resp :: %{__info__: map, data: Asana.User.response() | nil}

  @doc """
  Update a user

  A specific, existing user can be updated by making a PUT request on the
  URL for that user. Only the fields provided in the `data` block will be
  updated; any unspecified fields will remain unchanged.

  Returns the complete updated user record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `workspace`: The workspace to filter results on.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The user to update.
  """
  @spec update_user(user_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Users.update_user_200_json_resp()} | {:error, Asana.Error.t()}
  def update_user(user_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty, :workspace])

    client.request(%{
      args: [user_gid: user_gid, body: body],
      call: {Asana.Users, :update_user},
      url: "/users/#{user_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Users, :update_user_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_user_for_workspace_200_json_resp :: %{
          __info__: map,
          data: Asana.User.response() | nil
        }

  @doc """
  Update a user in a workspace or organization

  An existing user can be updated by making a PUT request on the URL for that user in the specified workspace or organization. Only the fields provided in the `data` block will be updated; any unspecified fields will remain unchanged.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The user to update.
  """
  @spec update_user_for_workspace(
          workspace_gid :: String.t(),
          user_gid :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Asana.Users.update_user_for_workspace_200_json_resp()} | {:error, Asana.Error.t()}
  def update_user_for_workspace(workspace_gid, user_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid, user_gid: user_gid, body: body],
      call: {Asana.Users, :update_user_for_workspace},
      url: "/workspaces/#{workspace_gid}/users/#{user_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Users, :update_user_for_workspace_200_json_resp}},
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
  def __fields__(:get_favorites_for_user_200_json_resp) do
    [data: [{Asana.AsanaNamedResource, :t}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_user_200_json_resp) do
    [data: {Asana.User, :response}]
  end

  def __fields__(:get_user_for_workspace_200_json_resp) do
    [data: {Asana.User, :response}]
  end

  def __fields__(:get_users_200_json_resp) do
    [data: [{Asana.User, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_users_for_team_200_json_resp) do
    [data: [{Asana.User, :compact}]]
  end

  def __fields__(:get_users_for_workspace_200_json_resp) do
    [data: [{Asana.User, :compact}]]
  end

  def __fields__(:update_user_200_json_resp) do
    [data: {Asana.User, :response}]
  end

  def __fields__(:update_user_for_workspace_200_json_resp) do
    [data: {Asana.User, :response}]
  end
end
