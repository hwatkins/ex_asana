defmodule Asana.Generated.Sections do
  @moduledoc """
  Provides API endpoints related to sections
  """

  @default_client Asana.OperationClient

  @type add_task_for_section_200_json_resp :: %{data: map | nil}

  @doc """
  Add task to section

  <b>Required scope: </b><code>tasks:write</code>

  Add a task to a specific, existing section. This will remove the task from other sections of the project.

  The task will be inserted at the top of a section unless an insert_before or insert_after parameter is declared.

  This does not work for separators (tasks with the resource_subtype of section).

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The task and optionally the insert location.
  """
  @spec add_task_for_section(section_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Sections.add_task_for_section_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def add_task_for_section(section_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [section_gid: section_gid, body: body],
      call: {Asana.Generated.Sections, :add_task_for_section},
      url: "/sections/#{section_gid}/addTask",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Sections, :add_task_for_section_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type create_section_for_project_201_json_resp :: %{
          data: Asana.Generated.SectionResponse.t() | nil
        }

  @doc """
  Create a section in a project

  Creates a new section in a project.
  Returns the full record of the newly created section.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The section to create.
  """
  @spec create_section_for_project(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Sections.create_section_for_project_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_section_for_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Sections, :create_section_for_project},
      url: "/projects/#{project_gid}/sections",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Sections, :create_section_for_project_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type delete_section_200_json_resp :: %{data: map | nil}

  @doc """
  Delete a section

  A specific, existing section can be deleted by making a DELETE request on
  the URL for that section.

  Note that sections must be empty to be deleted.

  The last remaining section cannot be deleted.

  Returns an empty data block.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_section(section_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Sections.delete_section_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def delete_section(section_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [section_gid: section_gid],
      call: {Asana.Generated.Sections, :delete_section},
      url: "/sections/#{section_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Generated.Sections, :delete_section_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_section_200_json_resp :: %{data: Asana.Generated.SectionResponse.t() | nil}

  @doc """
  Get a section

  Returns the complete record for a single section.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_section(section_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Sections.get_section_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_section(section_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [section_gid: section_gid],
      call: {Asana.Generated.Sections, :get_section},
      url: "/sections/#{section_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Sections, :get_section_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_sections_for_project_200_json_resp :: %{
          data: [Asana.Generated.SectionCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get sections in a project

  Returns the compact records for all sections in the specified project.

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
  @spec get_sections_for_project(project_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Sections.get_sections_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_sections_for_project(project_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid],
      call: {Asana.Generated.Sections, :get_sections_for_project},
      url: "/projects/#{project_gid}/sections",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Sections, :get_sections_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type insert_section_for_project_200_json_resp :: %{data: map | nil}

  @doc """
  Move or Insert sections

  Move sections relative to each other. One of
  `before_section` or `after_section` is required.

  Sections cannot be moved between projects.

  Returns an empty data block.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The section's move action.
  """
  @spec insert_section_for_project(project_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Sections.insert_section_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def insert_section_for_project(project_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [project_gid: project_gid, body: body],
      call: {Asana.Generated.Sections, :insert_section_for_project},
      url: "/projects/#{project_gid}/sections/insert",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Sections, :insert_section_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type update_section_200_json_resp :: %{data: Asana.Generated.SectionResponse.t() | nil}

  @doc """
  Update a section

  A specific, existing section can be updated by making a PUT request on
  the URL for that project. Only the fields provided in the `data` block
  will be updated; any unspecified fields will remain unchanged. (note that
  at this time, the only field that can be updated is the `name` field.)

  When using this method, it is best to specify only those fields you wish
  to change, or else you may overwrite changes made by another user since
  you last retrieved the task.

  Returns the complete updated section record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The section to create.
  """
  @spec update_section(section_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Sections.update_section_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def update_section(section_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [section_gid: section_gid, body: body],
      call: {Asana.Generated.Sections, :update_section},
      url: "/sections/#{section_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Sections, :update_section_200_json_resp}},
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
  def __fields__(:add_task_for_section_200_json_resp) do
    [data: :map]
  end

  def __fields__(:create_section_for_project_201_json_resp) do
    [data: {Asana.Generated.SectionResponse, :t}]
  end

  def __fields__(:delete_section_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_section_200_json_resp) do
    [data: {Asana.Generated.SectionResponse, :t}]
  end

  def __fields__(:get_sections_for_project_200_json_resp) do
    [data: [{Asana.Generated.SectionCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end

  def __fields__(:insert_section_for_project_200_json_resp) do
    [data: :map]
  end

  def __fields__(:update_section_200_json_resp) do
    [data: {Asana.Generated.SectionResponse, :t}]
  end
end
