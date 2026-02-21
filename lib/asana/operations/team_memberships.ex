defmodule Asana.TeamMemberships do
  @moduledoc """
  Provides API endpoints related to team memberships
  """

  @default_client Asana.Client

  @doc """
  Get a team membership

  <b>Required scope: </b><code>team_memberships:read</code>

  <table>
    <tr>
      <th>Field</th>
      <th>Required Scope</th>
    </tr>
    <tr>
      <td><code>team</code></td>
      <td><code>teams:read</code></td>
    </tr>
  </table>

  Returns the complete team membership record for a single team membership.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_team_membership(team_membership_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Team.Memberships.get_team_membership_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_team_membership(team_membership_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [team_membership_gid: team_membership_gid],
      call: {Asana.TeamMemberships, :get_team_membership},
      url: "/team_memberships/#{team_membership_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Team.Memberships, :get_team_membership_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @doc """
  Get team memberships

  <b>Required scope: </b><code>team_memberships:read</code>

  Returns compact team membership records.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `team`: Globally unique identifier for the team.
    * `user`: A string identifying a user. This can either be the string "me", an email, or the gid of a user. This parameter must be used with the workspace parameter.
    * `workspace`: Globally unique identifier for the workspace. This parameter must be used with the user parameter.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_team_memberships(opts :: keyword) ::
          {:ok, Asana.Team.Memberships.get_team_memberships_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_team_memberships(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :team, :user, :workspace])

    client.request(%{
      args: [],
      call: {Asana.TeamMemberships, :get_team_memberships},
      url: "/team_memberships",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Team.Memberships, :get_team_memberships_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @doc """
  Get memberships from a team

  <b>Required scope: </b><code>team_memberships:read</code>

  Returns the compact team memberships for the team.

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
  @spec get_team_memberships_for_team(team_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Team.Memberships.get_team_memberships_for_team_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_team_memberships_for_team(team_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [team_gid: team_gid],
      call: {Asana.TeamMemberships, :get_team_memberships_for_team},
      url: "/teams/#{team_gid}/team_memberships",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Team.Memberships, :get_team_memberships_for_team_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @doc """
  Get memberships from a user

  <b>Required scope: </b><code>team_memberships:read</code>

  Returns the compact team membership records for the user.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `workspace`: Globally unique identifier for the workspace.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_team_memberships_for_user(user_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Team.Memberships.get_team_memberships_for_user_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_team_memberships_for_user(user_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :workspace])

    client.request(%{
      args: [user_gid: user_gid],
      call: {Asana.TeamMemberships, :get_team_memberships_for_user},
      url: "/users/#{user_gid}/team_memberships",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Team.Memberships, :get_team_memberships_for_user_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end
end
