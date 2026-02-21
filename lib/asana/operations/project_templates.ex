defmodule Asana.ProjectTemplates do
  @moduledoc """
  Provides API endpoints related to project templates
  """

  @default_client Asana.Client

  @doc """
  Delete a project template

  A specific, existing project template can be deleted by making a DELETE request on the URL for that project template.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_project_template(project_template_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Project.Templates.delete_project_template_200_json_resp()}
          | {:error, Asana.Error.t()}
  def delete_project_template(project_template_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [project_template_gid: project_template_gid],
      call: {Asana.ProjectTemplates, :delete_project_template},
      url: "/project_templates/#{project_template_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Project.Templates, :delete_project_template_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {402, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a project template

  <b>Required scope: </b><code>project_templates:read</code>

  Returns the complete project template record for a single project template.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_project_template(project_template_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Project.Templates.get_project_template_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_project_template(project_template_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_template_gid: project_template_gid],
      call: {Asana.ProjectTemplates, :get_project_template},
      url: "/project_templates/#{project_template_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Project.Templates, :get_project_template_200_json_resp}},
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
  Get multiple project templates

  <b>Required scope: </b><code>project_templates:read</code>

  Returns the compact project template records for all project templates in the given team or workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `workspace`: The workspace to filter results on.
    * `team`: The team to filter projects on.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_project_templates(opts :: keyword) ::
          {:ok, Asana.Project.Templates.get_project_templates_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_project_templates(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :team, :workspace])

    client.request(%{
      args: [],
      call: {Asana.ProjectTemplates, :get_project_templates},
      url: "/project_templates",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Project.Templates, :get_project_templates_200_json_resp}},
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
  Get a team's project templates

  <b>Required scope: </b><code>project_templates:read</code>

  Returns the compact project template records for all project templates in the team.

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
  @spec get_project_templates_for_team(team_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Project.Templates.get_project_templates_for_team_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_project_templates_for_team(team_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [team_gid: team_gid],
      call: {Asana.ProjectTemplates, :get_project_templates_for_team},
      url: "/teams/#{team_gid}/project_templates",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Project.Templates, :get_project_templates_for_team_200_json_resp}},
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
  Instantiate a project from a project template

  <b>Required scope: </b><code>projects:write</code>

  Creates and returns a job that will asynchronously handle the project instantiation.

  To form this request, it is recommended to first make a request to [get a project template](/reference/getprojecttemplate). Then, from the response, copy the `gid` from the object in the `requested_dates` array. This `gid` should be used in `requested_dates` to instantiate a project.

  _Note: The body of this request will differ if your workspace is an organization. To determine if your workspace is an organization, use the [is_organization](/reference/workspaces) parameter._

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Describes the inputs used for instantiating a project, such as the resulting project's name, which team it should be created in, and values for date variables.
  """
  @spec instantiate_project(
          project_template_gid :: String.t(),
          body :: Asana.Project.Templates.instantiate_project_json_req(),
          opts :: keyword
        ) ::
          {:ok, Asana.Project.Templates.instantiate_project_201_json_resp()}
          | {:error, Asana.Error.t()}
  def instantiate_project(project_template_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_template_gid: project_template_gid, body: body],
      call: {Asana.ProjectTemplates, :instantiate_project},
      url: "/project_templates/#{project_template_gid}/instantiateProject",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Asana.Project.Templates, :instantiate_project_json_req}}],
      response: [
        {201, {Asana.Project.Templates, :instantiate_project_201_json_resp}},
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
