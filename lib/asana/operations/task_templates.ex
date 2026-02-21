defmodule Asana.TaskTemplates do
  @moduledoc """
  Provides API endpoints related to task templates
  """

  @default_client Asana.Client

  @doc """
  Delete a task template

  A specific, existing task template can be deleted by making a DELETE request on the URL for that task template. Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_task_template(task_template_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Task.Templates.delete_task_template_200_json_resp()}
          | {:error, Asana.Error.t()}
  def delete_task_template(task_template_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_template_gid: task_template_gid],
      call: {Asana.TaskTemplates, :delete_task_template},
      url: "/task_templates/#{task_template_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Task.Templates, :delete_task_template_200_json_resp}},
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
  Get a task template

  <b>Required scope: </b><code>task_templates:read</code>

  Returns the complete task template record for a single task template.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_task_template(task_template_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Task.Templates.get_task_template_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_task_template(task_template_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_template_gid: task_template_gid],
      call: {Asana.TaskTemplates, :get_task_template},
      url: "/task_templates/#{task_template_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Task.Templates, :get_task_template_200_json_resp}},
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
  Get multiple task templates

  <b>Required scope: </b><code>task_templates:read</code>

  Returns the compact task template records for some filtered set of task templates. You must specify a `project`

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `project`: The project to filter task templates on.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_task_templates(opts :: keyword) ::
          {:ok, Asana.Task.Templates.get_task_templates_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_task_templates(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :project])

    client.request(%{
      args: [],
      call: {Asana.TaskTemplates, :get_task_templates},
      url: "/task_templates",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Task.Templates, :get_task_templates_200_json_resp}},
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
  Instantiate a task from a task template

  Creates and returns a job that will asynchronously handle the task instantiation.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Describes the inputs used for instantiating a task - the task's name.
  """
  @spec instantiate_task(
          task_template_gid :: String.t(),
          body :: Asana.Task.Templates.instantiate_task_json_req(),
          opts :: keyword
        ) ::
          {:ok, Asana.Task.Templates.instantiate_task_201_json_resp()} | {:error, Asana.Error.t()}
  def instantiate_task(task_template_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_template_gid: task_template_gid, body: body],
      call: {Asana.TaskTemplates, :instantiate_task},
      url: "/task_templates/#{task_template_gid}/instantiateTask",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Asana.Task.Templates, :instantiate_task_json_req}}],
      response: [
        {201, {Asana.Task.Templates, :instantiate_task_201_json_resp}},
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
