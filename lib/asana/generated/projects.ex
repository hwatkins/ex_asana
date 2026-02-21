defmodule Asana.Generated.Projects do
  @moduledoc """
  Provides API endpoints related to projects
  """

  @default_client Asana.OperationClient

  @type add_custom_field_setting_for_project_200_json_resp :: %{
          data: Asana.Generated.CustomFieldSettingResponse.t() | nil
        }

  @doc """
  Add a custom field to a project

  <b>Required scope: </b><code>projects:write</code>

  Custom fields are associated with projects by way of custom field settings.  This method creates a setting for the project.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Information about the custom field setting.
  """
  @spec add_custom_field_setting_for_project(
          project_gid :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Asana.Generated.Projects.add_custom_field_setting_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def add_custom_field_setting_for_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Projects, :add_custom_field_setting_for_project},
      url: "/projects/#{project_gid}/addCustomFieldSetting",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Projects, :add_custom_field_setting_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type add_followers_for_project_200_json_resp :: %{
          data: Asana.Generated.ProjectResponse.t() | nil
        }

  @doc """
  Add followers to a project

  Adds the specified list of users as followers to the project. Followers are a subset of members who have opted in to receive "tasks added" notifications for a project. Therefore, if the users are not already members of the project, they will also become members as a result of this operation.
  Returns the updated project record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Information about the followers being added.
  """
  @spec add_followers_for_project(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.add_followers_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def add_followers_for_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Projects, :add_followers_for_project},
      url: "/projects/#{project_gid}/addFollowers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Projects, :add_followers_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type add_members_for_project_200_json_resp :: %{
          data: Asana.Generated.ProjectResponse.t() | nil
        }

  @doc """
  Add users to a project

  Adds the specified list of users as members of the project. Note that a user being added as a member may also be added as a *follower* as a result of this operation. This is because the user's default notification settings (i.e., in the "Notifications" tab of "My Profile Settings") will override this endpoint's default behavior of setting "Tasks added" notifications to `false`.
  Returns the updated project record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Information about the members being added.
  """
  @spec add_members_for_project(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.add_members_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def add_members_for_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Projects, :add_members_for_project},
      url: "/projects/#{project_gid}/addMembers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Projects, :add_members_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type create_project_201_json_resp :: %{data: Asana.Generated.ProjectResponse.t() | nil}

  @doc """
  Create a project

  <b>Required scope: </b><code>projects:write</code>

  Create a new project in a workspace or team.

  Every project is required to be created in a specific workspace or
  organization, and this cannot be changed once set. Note that you can use
  the `workspace` parameter regardless of whether or not it is an
  organization.

  If the workspace for your project is an organization, you must also
  supply a `team` to share the project with.

  Returns the full record of the newly created project.

  **Deprecation notice:** The `team` parameter and the `private_to_team`
  value for `privacy_setting` are deprecated. When either is included in
  the request, the `Asana-Change` response header will indicate an affected
  deprecation. Clients should switch to using `POST /memberships` with
  `{ parent: project, member: team }` to share a project with a team after
  creation.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The project to create.
  """
  @spec create_project(body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.create_project_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_project(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Generated.Projects, :create_project},
      url: "/projects",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Projects, :create_project_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type create_project_for_team_201_json_resp :: %{
          data: Asana.Generated.ProjectResponse.t() | nil
        }

  @doc """
  Create a project in a team

  <b>Required scope: </b><code>projects:write</code>

  Creates a project shared with the given team.

  Returns the full record of the newly created project.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The new project to create.
  """
  @spec create_project_for_team(team_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.create_project_for_team_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_project_for_team(team_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [team_gid: team_gid, body: body],
      call: {Asana.Generated.Projects, :create_project_for_team},
      url: "/teams/#{team_gid}/projects",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Projects, :create_project_for_team_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type create_project_for_workspace_201_json_resp :: %{
          data: Asana.Generated.ProjectResponse.t() | nil
        }

  @doc """
  Create a project in a workspace

  <b>Required scope: </b><code>projects:write</code>

  Creates a project in the workspace.

  If the workspace for your project is an organization, you must also
  supply a team to share the project with.

  Returns the full record of the newly created project.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The new project to create.
  """
  @spec create_project_for_workspace(workspace_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.create_project_for_workspace_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_project_for_workspace(workspace_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid, body: body],
      call: {Asana.Generated.Projects, :create_project_for_workspace},
      url: "/workspaces/#{workspace_gid}/projects",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Projects, :create_project_for_workspace_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type delete_project_200_json_resp :: %{data: map | nil}

  @doc """
  Delete a project

  <b>Required scope: </b><code>projects:delete</code>

  A specific, existing project can be deleted by making a DELETE request on
  the URL for that project.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_project(project_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Projects.delete_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def delete_project(project_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [project_gid: project_gid],
      call: {Asana.Generated.Projects, :delete_project},
      url: "/projects/#{project_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Generated.Projects, :delete_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type duplicate_project_201_json_resp :: %{data: Asana.Generated.JobResponse.t() | nil}

  @doc """
  Duplicate a project

  <b>Required scope: </b><code>projects:write</code>

  Creates and returns a job that will asynchronously handle the duplication.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Describes the duplicate's name and the elements that will be duplicated.
  """
  @spec duplicate_project(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.duplicate_project_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def duplicate_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Projects, :duplicate_project},
      url: "/projects/#{project_gid}/duplicate",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Projects, :duplicate_project_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_project_200_json_resp :: %{data: Asana.Generated.ProjectResponse.t() | nil}

  @doc """
  Get a project

  <b>Required scope: </b><code>projects:read</code>

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

  Returns the complete project record for a single project.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_project(project_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Projects.get_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_project(project_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid],
      call: {Asana.Generated.Projects, :get_project},
      url: "/projects/#{project_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Projects, :get_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_projects_200_json_resp :: %{
          data: [Asana.Generated.ProjectCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get multiple projects

  <b>Required scope: </b><code>projects:read</code>

  Returns the compact project records for some filtered set of projects. Use one or more of the parameters provided to filter the projects returned.
  *Note: This endpoint may timeout for large domains. Try filtering by team!*
  **The `team` filter is deprecated.** Please use `GET /memberships` with `{ member: team, resource_subtype: project_membership }` to find projects shared with a team.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `workspace`: The workspace or organization to filter projects on.
    * `team`: **Deprecated.** The team to filter projects on. Please use `GET /memberships` with `{ member: team, resource_subtype: project_membership }` instead.
    * `archived`: Only return projects whose `archived` field takes on the value of this parameter.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_projects(opts :: keyword) ::
          {:ok, Asana.Generated.Projects.get_projects_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_projects(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:archived, :limit, :offset, :opt_fields, :opt_pretty, :team, :workspace])

    client.request(%{
      args: [],
      call: {Asana.Generated.Projects, :get_projects},
      url: "/projects",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Projects, :get_projects_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_projects_for_task_200_json_resp :: %{
          data: [Asana.Generated.ProjectCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get projects a task is in

  <b>Required scope: </b><code>projects:read</code>

  Returns a compact representation of all of the projects the task is in.

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
  @spec get_projects_for_task(task_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Projects.get_projects_for_task_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_projects_for_task(task_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid],
      call: {Asana.Generated.Projects, :get_projects_for_task},
      url: "/tasks/#{task_gid}/projects",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Projects, :get_projects_for_task_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_projects_for_team_200_json_resp :: %{
          data: [Asana.Generated.ProjectCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get a team's projects

  <b>Required scope: </b><code>projects:read</code>

  Returns the compact project records for all projects in the team.
  *Deprecated: This endpoint is deprecated. Use `GET /memberships` with `member` set to the team GID and `resource_subtype` set to `project_membership` to fetch projects shared with a team.*

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `archived`: Only return projects whose `archived` field takes on the value of this parameter.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_projects_for_team(team_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Projects.get_projects_for_team_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_projects_for_team(team_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:archived, :limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [team_gid: team_gid],
      call: {Asana.Generated.Projects, :get_projects_for_team},
      url: "/teams/#{team_gid}/projects",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Projects, :get_projects_for_team_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_projects_for_workspace_200_json_resp :: %{
          data: [Asana.Generated.ProjectCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get all projects in a workspace

  <b>Required scope: </b><code>projects:read</code>

  Returns the compact project records for all projects in the workspace.
  *Note: This endpoint may timeout for large domains. To fetch projects shared with a specific team, use `GET /memberships` with `member` set to the team GID and `resource_subtype` set to `project_membership`.*

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `archived`: Only return projects whose `archived` field takes on the value of this parameter.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_projects_for_workspace(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Projects.get_projects_for_workspace_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_projects_for_workspace(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:archived, :limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.Generated.Projects, :get_projects_for_workspace},
      url: "/workspaces/#{workspace_gid}/projects",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Projects, :get_projects_for_workspace_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_task_counts_for_project_200_json_resp :: %{
          data: Asana.Generated.TaskCountResponse.t() | nil
        }

  @doc """
  Get task count of a project

  <b>Required scope: </b><code>projects:read</code>

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

  Get an object that holds task count fields. **All fields are excluded by default**. You must [opt in](/docs/inputoutput-options) using `opt_fields` to get any information from this endpoint.

  This endpoint has an additional [rate limit](/docs/rate-limits) and each field counts especially high against our [cost limits](/docs/rate-limits#cost-limits).

  Milestones are just tasks, so they are included in the `num_tasks`, `num_incomplete_tasks`, and `num_completed_tasks` counts.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_task_counts_for_project(project_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Projects.get_task_counts_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_task_counts_for_project(project_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid],
      call: {Asana.Generated.Projects, :get_task_counts_for_project},
      url: "/projects/#{project_gid}/task_counts",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Projects, :get_task_counts_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type project_save_as_template_201_json_resp :: %{data: Asana.Generated.JobResponse.t() | nil}

  @doc """
  Create a project template from a project

  Creates and returns a job that will asynchronously handle the project template creation.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Describes the inputs used for creating a project template, such as the resulting project template's name, which team it should be created in.
  """
  @spec project_save_as_template(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.project_save_as_template_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def project_save_as_template(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Projects, :project_save_as_template},
      url: "/projects/#{project_gid}/saveAsTemplate",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Projects, :project_save_as_template_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type remove_custom_field_setting_for_project_200_json_resp :: %{data: map | nil}

  @doc """
  Remove a custom field from a project

  <b>Required scope: </b><code>projects:write</code>

  Removes a custom field setting from a project.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  Information about the custom field setting being removed.
  """
  @spec remove_custom_field_setting_for_project(
          project_gid :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Asana.Generated.Projects.remove_custom_field_setting_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def remove_custom_field_setting_for_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Projects, :remove_custom_field_setting_for_project},
      url: "/projects/#{project_gid}/removeCustomFieldSetting",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Projects, :remove_custom_field_setting_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type remove_followers_for_project_200_json_resp :: %{
          data: Asana.Generated.ProjectResponse.t() | nil
        }

  @doc """
  Remove followers from a project

  Removes the specified list of users from following the project, this will not affect project membership status.
  Returns the updated project record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Information about the followers being removed.
  """
  @spec remove_followers_for_project(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.remove_followers_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def remove_followers_for_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Projects, :remove_followers_for_project},
      url: "/projects/#{project_gid}/removeFollowers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Projects, :remove_followers_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type remove_members_for_project_200_json_resp :: %{
          data: Asana.Generated.ProjectResponse.t() | nil
        }

  @doc """
  Remove users from a project

  Removes the specified list of users from members of the project.
  Returns the updated project record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Information about the members being removed.
  """
  @spec remove_members_for_project(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.remove_members_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def remove_members_for_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Projects, :remove_members_for_project},
      url: "/projects/#{project_gid}/removeMembers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Projects, :remove_members_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type update_project_200_json_resp :: %{data: Asana.Generated.ProjectResponse.t() | nil}

  @doc """
  Update a project

  <b>Required scope: </b><code>projects:write</code>

  A specific, existing project can be updated by making a PUT request on
  the URL for that project. Only the fields provided in the `data` block
  will be updated; any unspecified fields will remain unchanged.

  When using this method, it is best to specify only those fields you wish
  to change, or else you may overwrite changes made by another user since
  you last retrieved the task.

  Returns the complete updated project record.

  **Deprecation notice:** Updating the `team` field is deprecated. When this
  field is included in the request, the `Asana-Change` response header will
  indicate an affected deprecation. Clients should switch to using
  `POST /memberships` with `{ parent: project, member: team }` to share a
  project with a team.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the project.
  """
  @spec update_project(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Projects.update_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def update_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Projects, :update_project},
      url: "/projects/#{project_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Projects, :update_project_200_json_resp}},
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
  def __fields__(:add_custom_field_setting_for_project_200_json_resp) do
    [data: {Asana.Generated.CustomFieldSettingResponse, :t}]
  end

  def __fields__(:add_followers_for_project_200_json_resp) do
    [data: {Asana.Generated.ProjectResponse, :t}]
  end

  def __fields__(:add_members_for_project_200_json_resp) do
    [data: {Asana.Generated.ProjectResponse, :t}]
  end

  def __fields__(:create_project_201_json_resp) do
    [data: {Asana.Generated.ProjectResponse, :t}]
  end

  def __fields__(:create_project_for_team_201_json_resp) do
    [data: {Asana.Generated.ProjectResponse, :t}]
  end

  def __fields__(:create_project_for_workspace_201_json_resp) do
    [data: {Asana.Generated.ProjectResponse, :t}]
  end

  def __fields__(:delete_project_200_json_resp) do
    [data: :map]
  end

  def __fields__(:duplicate_project_201_json_resp) do
    [data: {Asana.Generated.JobResponse, :t}]
  end

  def __fields__(:get_project_200_json_resp) do
    [data: {Asana.Generated.ProjectResponse, :t}]
  end

  def __fields__(:get_projects_200_json_resp) do
    [data: [{Asana.Generated.ProjectCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end

  def __fields__(:get_projects_for_task_200_json_resp) do
    [data: [{Asana.Generated.ProjectCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end

  def __fields__(:get_projects_for_team_200_json_resp) do
    [data: [{Asana.Generated.ProjectCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end

  def __fields__(:get_projects_for_workspace_200_json_resp) do
    [data: [{Asana.Generated.ProjectCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end

  def __fields__(:get_task_counts_for_project_200_json_resp) do
    [data: {Asana.Generated.TaskCountResponse, :t}]
  end

  def __fields__(:project_save_as_template_201_json_resp) do
    [data: {Asana.Generated.JobResponse, :t}]
  end

  def __fields__(:remove_custom_field_setting_for_project_200_json_resp) do
    [data: :map]
  end

  def __fields__(:remove_followers_for_project_200_json_resp) do
    [data: {Asana.Generated.ProjectResponse, :t}]
  end

  def __fields__(:remove_members_for_project_200_json_resp) do
    [data: {Asana.Generated.ProjectResponse, :t}]
  end

  def __fields__(:update_project_200_json_resp) do
    [data: {Asana.Generated.ProjectResponse, :t}]
  end
end
