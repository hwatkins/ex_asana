defmodule Asana.Generated.Teams do
  @moduledoc """
  Provides API endpoints related to teams
  """

  @default_client Asana.OperationClient

  @type add_user_for_team_200_json_resp :: %{
          data: Asana.Generated.TeamMembershipResponse.t() | nil
        }

  @doc """
  Add a user to a team

  The user making this call must be a member of the team in order to add others. The user being added must exist in the same organization as the team.

  Returns the complete team membership record for the newly added user.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The user to add to the team.
  """
  @spec add_user_for_team(team_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Teams.add_user_for_team_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def add_user_for_team(team_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [team_gid: team_gid, body: body],
      call: {Asana.Generated.Teams, :add_user_for_team},
      url: "/teams/#{team_gid}/addUser",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Teams, :add_user_for_team_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type create_team_201_json_resp :: %{data: Asana.Generated.TeamResponse.t() | nil}

  @doc """
  Create a team

  Creates a team within the current workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The team to create.
  """
  @spec create_team(body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Teams.create_team_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_team(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Generated.Teams, :create_team},
      url: "/teams",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Teams, :create_team_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_team_200_json_resp :: %{data: Asana.Generated.TeamResponse.t() | nil}

  @doc """
  Get a team

  <b>Required scope: </b><code>teams:read</code>

  Returns the full record for a single team.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_team(team_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Teams.get_team_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_team(team_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [team_gid: team_gid],
      call: {Asana.Generated.Teams, :get_team},
      url: "/teams/#{team_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Teams, :get_team_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_teams_for_user_200_json_resp :: %{
          data: [Asana.Generated.TeamCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get teams for a user

  <b>Required scope: </b><code>teams:read</code>

  Returns the compact records for all teams to which the given user is assigned.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `organization`: The workspace or organization to filter teams on.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_teams_for_user(user_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Teams.get_teams_for_user_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_teams_for_user(user_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :organization])

    client.request(%{
      args: [user_gid: user_gid],
      call: {Asana.Generated.Teams, :get_teams_for_user},
      url: "/users/#{user_gid}/teams",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Teams, :get_teams_for_user_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_teams_for_workspace_200_json_resp :: %{
          data: [Asana.Generated.TeamCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get teams in a workspace

  <b>Required scope: </b><code>teams:read</code>

  Returns the compact records for all teams in the workspace visible to the authorized user.

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
  @spec get_teams_for_workspace(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Teams.get_teams_for_workspace_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_teams_for_workspace(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.Generated.Teams, :get_teams_for_workspace},
      url: "/workspaces/#{workspace_gid}/teams",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Teams, :get_teams_for_workspace_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type remove_user_for_team_200_json_resp :: %{data: map | nil}

  @doc """
  Remove a user from a team

  The user making this call must be a member of the team in order to remove themselves or others.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The user to remove from the team.
  """
  @spec remove_user_for_team(team_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Teams.remove_user_for_team_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def remove_user_for_team(team_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [team_gid: team_gid, body: body],
      call: {Asana.Generated.Teams, :remove_user_for_team},
      url: "/teams/#{team_gid}/removeUser",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Teams, :remove_user_for_team_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type update_team_200_json_resp :: %{data: Asana.Generated.TeamResponse.t() | nil}

  @doc """
  Update a team

  Updates a team within the current workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The team to update.
  """
  @spec update_team(team_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Teams.update_team_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def update_team(team_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [team_gid: team_gid, body: body],
      call: {Asana.Generated.Teams, :update_team},
      url: "/teams/#{team_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Teams, :update_team_200_json_resp}},
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
  def __fields__(:add_user_for_team_200_json_resp) do
    [data: {Asana.Generated.TeamMembershipResponse, :t}]
  end

  def __fields__(:create_team_201_json_resp) do
    [data: {Asana.Generated.TeamResponse, :t}]
  end

  def __fields__(:get_team_200_json_resp) do
    [data: {Asana.Generated.TeamResponse, :t}]
  end

  def __fields__(:get_teams_for_user_200_json_resp) do
    [data: [{Asana.Generated.TeamCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end

  def __fields__(:get_teams_for_workspace_200_json_resp) do
    [data: [{Asana.Generated.TeamCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end

  def __fields__(:remove_user_for_team_200_json_resp) do
    [data: :map]
  end

  def __fields__(:update_team_200_json_resp) do
    [data: {Asana.Generated.TeamResponse, :t}]
  end
end
