defmodule Asana.ProjectBriefs do
  @moduledoc """
  Provides API endpoints related to project briefs
  """

  @default_client Asana.Client

  @doc """
  Create a project brief

  Creates a new project brief.

  Returns the full record of the newly created project brief.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The project brief to create.
  """
  @spec create_project_brief(
          project_gid :: String.t(),
          body :: Asana.Project.Briefs.create_project_brief_json_req(),
          opts :: keyword
        ) ::
          {:ok, Asana.Project.Briefs.create_project_brief_201_json_resp()}
          | {:error, Asana.Error.t()}
  def create_project_brief(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.ProjectBriefs, :create_project_brief},
      url: "/projects/#{project_gid}/project_briefs",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Asana.Project.Briefs, :create_project_brief_json_req}}],
      response: [
        {201, {Asana.Project.Briefs, :create_project_brief_201_json_resp}},
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
  Delete a project brief

  Deletes a specific, existing project brief.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_project_brief(project_brief_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Project.Briefs.delete_project_brief_200_json_resp()}
          | {:error, Asana.Error.t()}
  def delete_project_brief(project_brief_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [project_brief_gid: project_brief_gid],
      call: {Asana.ProjectBriefs, :delete_project_brief},
      url: "/project_briefs/#{project_brief_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Project.Briefs, :delete_project_brief_200_json_resp}},
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
  Get a project brief

  Get the full record for a project brief.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_project_brief(project_brief_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Project.Briefs.get_project_brief_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_project_brief(project_brief_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_brief_gid: project_brief_gid],
      call: {Asana.ProjectBriefs, :get_project_brief},
      url: "/project_briefs/#{project_brief_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Project.Briefs, :get_project_brief_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {402, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {424, {Asana.Error, :response}},
        {500, {Asana.Error, :response}},
        {501, {Asana.Error, :response}},
        {503, {Asana.Error, :response}},
        {504, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a project brief

  An existing project brief can be updated by making a PUT request on the URL for
  that project brief. Only the fields provided in the `data` block will be updated;
  any unspecified fields will remain unchanged.

  Returns the complete updated project brief record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the project brief.
  """
  @spec update_project_brief(
          project_brief_gid :: String.t(),
          body :: Asana.Project.Briefs.update_project_brief_json_req(),
          opts :: keyword
        ) ::
          {:ok, Asana.Project.Briefs.update_project_brief_200_json_resp()}
          | {:error, Asana.Error.t()}
  def update_project_brief(project_brief_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_brief_gid: project_brief_gid, body: body],
      call: {Asana.ProjectBriefs, :update_project_brief},
      url: "/project_briefs/#{project_brief_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", {Asana.Project.Briefs, :update_project_brief_json_req}}],
      response: [
        {200, {Asana.Project.Briefs, :update_project_brief_200_json_resp}},
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
