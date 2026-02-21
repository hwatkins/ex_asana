defmodule Asana.ProjectMemberships do
  @moduledoc """
  Provides API endpoints related to project memberships
  """

  @default_client Asana.Client

  @doc """
  Get a project membership

  Returns the complete project record for a single project membership.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_project_membership(project_membership_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Project.Memberships.get_project_membership_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_project_membership(project_membership_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_membership_gid: project_membership_gid],
      call: {Asana.ProjectMemberships, :get_project_membership},
      url: "/project_memberships/#{project_membership_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Project.Memberships, :get_project_membership_200_json_resp}},
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
  Get memberships from a project

  Returns the compact project membership records for the project.

  ## Options

    * `user`: A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_project_memberships_for_project(project_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Project.Memberships.get_project_memberships_for_project_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_project_memberships_for_project(project_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :user])

    client.request(%{
      args: [project_gid: project_gid],
      call: {Asana.ProjectMemberships, :get_project_memberships_for_project},
      url: "/projects/#{project_gid}/project_memberships",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Project.Memberships, :get_project_memberships_for_project_200_json_resp}},
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
