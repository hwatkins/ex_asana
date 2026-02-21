defmodule Asana.Tasks do
  @moduledoc """
  Provides API endpoints related to tasks
  """

  @default_client Asana.Client

  @type add_dependencies_for_task_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Set dependencies for a task

  <b>Required scope: </b><code>tasks:write</code>

  Marks a set of tasks as dependencies of this task, if they are not already dependencies. *A task can have at most 30 dependents and dependencies combined*.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The list of tasks to set as dependencies.
  """
  @spec add_dependencies_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.add_dependencies_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def add_dependencies_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :add_dependencies_for_task},
      url: "/tasks/#{task_gid}/addDependencies",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :add_dependencies_for_task_200_json_resp}},
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

  @type add_dependents_for_task_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Set dependents for a task

  <b>Required scope: </b><code>tasks:write</code>

  Marks a set of tasks as dependents of this task, if they are not already dependents. *A task can have at most 30 dependents and dependencies combined*.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The list of tasks to add as dependents.
  """
  @spec add_dependents_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.add_dependents_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def add_dependents_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :add_dependents_for_task},
      url: "/tasks/#{task_gid}/addDependents",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :add_dependents_for_task_200_json_resp}},
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

  @type add_followers_for_task_200_json_resp :: %{
          __info__: map,
          data: Asana.Task.response() | nil
        }

  @doc """
  Add followers to a task

  <b>Required scope: </b><code>tasks:write</code>

  Adds followers to a task. Returns an empty data block.
  Each task can be associated with zero or more followers in the system.
  Requests to add/remove followers, if successful, will return the complete updated task record, described above.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The followers to add to the task.
  """
  @spec add_followers_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.add_followers_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def add_followers_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :add_followers_for_task},
      url: "/tasks/#{task_gid}/addFollowers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :add_followers_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type add_project_for_task_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Add a project to a task

  <b>Required scope: </b><code>tasks:write</code>

  Adds the task to the specified project, in the optional location
  specified. If no location arguments are given, the task will be added to
  the end of the project.

  `addProject` can also be used to reorder a task within a project or
  section that already contains it.

  **Positioning the task:**
  - Use `insert_before` or `insert_after` with a task ID to position relative to another task
  - Use `section` alone to add the task to the end of a section
  - Use `section` with `insert_after: null` to add to the **beginning** of a section
  - Use `section` with `insert_before: null` to add to the **end** of a section
  - Use `section` with `insert_before` or `insert_after` (non-null) to position relative to a task within that section. The anchor task must be in the specified section.

  At most one of `insert_before` or `insert_after` should be specified (both cannot be used together).

  A task can have at most 20 projects multi-homed to it.

  Returns an empty data block.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The project to add the task to.
  """
  @spec add_project_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.add_project_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def add_project_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :add_project_for_task},
      url: "/tasks/#{task_gid}/addProject",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :add_project_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type add_tag_for_task_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Add a tag to a task

  <b>Required scope: </b><code>tasks:write</code>

  Adds a tag to a task. Returns an empty data block.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The tag to add to the task.
  """
  @spec add_tag_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.add_tag_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def add_tag_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :add_tag_for_task},
      url: "/tasks/#{task_gid}/addTag",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :add_tag_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type create_subtask_for_task_201_json_resp :: %{
          __info__: map,
          data: Asana.Task.response() | nil
        }

  @doc """
  Create a subtask

  <b>Required scope: </b><code>tasks:write</code>

  Creates a new subtask and adds it to the parent task. Returns the full record for the newly created subtask.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The new subtask to create.
  """
  @spec create_subtask_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.create_subtask_for_task_201_json_resp()} | {:error, Asana.Error.t()}
  def create_subtask_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :create_subtask_for_task},
      url: "/tasks/#{task_gid}/subtasks",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Tasks, :create_subtask_for_task_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type create_task_201_json_resp :: %{__info__: map, data: Asana.Task.response() | nil}

  @doc """
  Create a task

  <b>Required scope: </b><code>tasks:write</code>

  Creating a new task is as easy as POSTing to the `/tasks` endpoint with a
  data block containing the fields you’d like to set on the task. Any
  unspecified fields will take on default values.

  Every task is required to be created in a specific workspace, and this
  workspace cannot be changed once set. The workspace need not be set
  explicitly if you specify `projects` or a `parent` task instead.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The task to create.
  """
  @spec create_task(body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.create_task_201_json_resp()} | {:error, Asana.Error.t()}
  def create_task(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Tasks, :create_task},
      url: "/tasks",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Tasks, :create_task_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type delete_task_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a task

  <b>Required scope: </b><code>tasks:delete</code>

  A specific, existing task can be deleted by making a DELETE request on
  the URL for that task. Deleted tasks go into the “trash” of the user
  making the delete request. Tasks can be recovered from the trash within a
  period of 30 days; afterward they are completely removed from the system.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_task(task_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.delete_task_200_json_resp()} | {:error, Asana.Error.t()}
  def delete_task(task_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_gid: task_gid],
      call: {Asana.Tasks, :delete_task},
      url: "/tasks/#{task_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Tasks, :delete_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type duplicate_task_201_json_resp :: %{__info__: map, data: Asana.Job.response() | nil}

  @doc """
  Duplicate a task

  <b>Required scope: </b><code>tasks:write</code>

  Creates and returns a job that will asynchronously handle the duplication.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Describes the duplicate's name and the fields that will be duplicated.
  """
  @spec duplicate_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.duplicate_task_201_json_resp()} | {:error, Asana.Error.t()}
  def duplicate_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :duplicate_task},
      url: "/tasks/#{task_gid}/duplicate",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Tasks, :duplicate_task_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_dependencies_for_task_200_json_resp :: %{
          __info__: map,
          data: [Asana.Task.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get dependencies from a task

  <b>Required scope: </b><code>tasks:read</code>

  Returns the compact representations of all of the dependencies of a task.

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
  @spec get_dependencies_for_task(task_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.get_dependencies_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def get_dependencies_for_task(task_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid],
      call: {Asana.Tasks, :get_dependencies_for_task},
      url: "/tasks/#{task_gid}/dependencies",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :get_dependencies_for_task_200_json_resp}},
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

  @type get_dependents_for_task_200_json_resp :: %{
          __info__: map,
          data: [Asana.Task.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get dependents from a task

  <b>Required scope: </b><code>tasks:read</code>

  Returns the compact representations of all of the dependents of a task.

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
  @spec get_dependents_for_task(task_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.get_dependents_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def get_dependents_for_task(task_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid],
      call: {Asana.Tasks, :get_dependents_for_task},
      url: "/tasks/#{task_gid}/dependents",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :get_dependents_for_task_200_json_resp}},
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

  @type get_subtasks_for_task_200_json_resp :: %{
          __info__: map,
          data: [Asana.Task.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get subtasks from a task

  <b>Required scope: </b><code>tasks:read</code>

  Returns a compact representation of all of the subtasks of a task.

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
  @spec get_subtasks_for_task(task_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.get_subtasks_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def get_subtasks_for_task(task_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid],
      call: {Asana.Tasks, :get_subtasks_for_task},
      url: "/tasks/#{task_gid}/subtasks",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :get_subtasks_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_task_200_json_resp :: %{__info__: map, data: Asana.Task.response() | nil}

  @doc """
  Get a task

  <b>Required scope: </b><code>tasks:read</code>

  <table>
    <tr>
      <th>Field</th>
      <th>Required Scope</th>
    </tr>
    <tr>
      <td><code>memberships</code></td>
      <td><code>projects:read</code>, <code>project_sections:read</code></td>
    </tr>
    <tr>
      <td><code>actual_time_minutes</code></td>
      <td><code>time_tracking_entries:read</code></td>
    </tr>
  </table>

  Returns the complete task record for a single task.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_task(task_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.get_task_200_json_resp()} | {:error, Asana.Error.t()}
  def get_task(task_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid],
      call: {Asana.Tasks, :get_task},
      url: "/tasks/#{task_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :get_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_task_for_custom_id_200_json_resp :: %{
          __info__: map,
          data: Asana.Task.response() | nil
        }

  @doc """
  Get a task for a given custom ID

  <b>Required scope: </b><code>tasks:read</code>

  <table>
    <tr>
      <th>Field</th>
      <th>Required Scope</th>
    </tr>
    <tr>
      <td><code>memberships</code></td>
      <td><code>projects:read</code>, <code>project_sections:read</code></td>
    </tr>
    <tr>
      <td><code>actual_time_minutes</code></td>
      <td><code>time_tracking_entries:read</code></td>
    </tr>
  </table>

  Returns a task given a custom ID shortcode.
  """
  @spec get_task_for_custom_id(
          workspace_gid :: String.t(),
          custom_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Asana.Tasks.get_task_for_custom_id_200_json_resp()} | {:error, Asana.Error.t()}
  def get_task_for_custom_id(workspace_gid, custom_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [workspace_gid: workspace_gid, custom_id: custom_id],
      call: {Asana.Tasks, :get_task_for_custom_id},
      url: "/workspaces/#{workspace_gid}/tasks/custom_id/#{custom_id}",
      method: :get,
      response: [
        {200, {Asana.Tasks, :get_task_for_custom_id_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_tasks_200_json_resp :: %{
          __info__: map,
          data: [Asana.Task.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get multiple tasks

  <b>Required scope: </b><code>tasks:read</code>

  Returns the compact task records for some filtered set of tasks. Use one or more of the parameters provided to filter the tasks returned. You must specify a `project` or `tag` if you do not specify `assignee` and `workspace`.

  For more complex task retrieval, use [workspaces/{workspace_gid}/tasks/search](/reference/searchtasksforworkspace).

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `assignee`: The assignee to filter tasks on. If searching for unassigned tasks, assignee.any = null can be specified.
      *Note: If you specify `assignee`, you must also specify the `workspace` to filter on.*
    * `project`: The project to filter tasks on.
    * `section`: The section to filter tasks on.
    * `workspace`: The workspace to filter tasks on.
      *Note: If you specify `workspace`, you must also specify the `assignee` to filter on.*
    * `completed_since`: Only return tasks that are either incomplete or that have been completed since this time.
    * `modified_since`: Only return tasks that have been modified since the given time.
      
      *Note: A task is considered “modified” if any of its properties
      change, or associations between it and other objects are modified
      (e.g.  a task being added to a project). A task is not considered
      modified just because another object it is associated with (e.g. a
      subtask) is modified. Actions that count as modifying the task
      include assigning, renaming, completing, and adding stories.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_tasks(opts :: keyword) ::
          {:ok, Asana.Tasks.get_tasks_200_json_resp()} | {:error, Asana.Error.t()}
  def get_tasks(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :assignee,
        :completed_since,
        :limit,
        :modified_since,
        :offset,
        :opt_fields,
        :opt_pretty,
        :project,
        :section,
        :workspace
      ])

    client.request(%{
      args: [],
      call: {Asana.Tasks, :get_tasks},
      url: "/tasks",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :get_tasks_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_tasks_for_project_200_json_resp :: %{
          __info__: map,
          data: [Asana.Task.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get tasks from a project

  <b>Required scope: </b><code>tasks:read</code>

  Returns the compact task records for all tasks within the given project, ordered by their priority within the project. Tasks can exist in more than one project at a time.

  ## Options

    * `completed_since`: Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*.
      
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_tasks_for_project(project_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.get_tasks_for_project_200_json_resp()} | {:error, Asana.Error.t()}
  def get_tasks_for_project(project_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:completed_since, :limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid],
      call: {Asana.Tasks, :get_tasks_for_project},
      url: "/projects/#{project_gid}/tasks",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :get_tasks_for_project_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_tasks_for_section_200_json_resp :: %{
          __info__: map,
          data: [Asana.Task.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get tasks from a section

  <b>Required scope: </b><code>tasks:read</code>

  *Board view only*: Returns the compact section records for all tasks within the given section.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `completed_since`: Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*.
      
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_tasks_for_section(section_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.get_tasks_for_section_200_json_resp()} | {:error, Asana.Error.t()}
  def get_tasks_for_section(section_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:completed_since, :limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [section_gid: section_gid],
      call: {Asana.Tasks, :get_tasks_for_section},
      url: "/sections/#{section_gid}/tasks",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :get_tasks_for_section_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_tasks_for_tag_200_json_resp :: %{
          __info__: map,
          data: [Asana.Task.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get tasks from a tag

  <b>Required scope: </b><code>tasks:read</code>

  Returns the compact task records for all tasks with the given tag. Tasks can have more than one tag at a time.

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
  @spec get_tasks_for_tag(tag_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.get_tasks_for_tag_200_json_resp()} | {:error, Asana.Error.t()}
  def get_tasks_for_tag(tag_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [tag_gid: tag_gid],
      call: {Asana.Tasks, :get_tasks_for_tag},
      url: "/tags/#{tag_gid}/tasks",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :get_tasks_for_tag_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_tasks_for_user_task_list_200_json_resp :: %{
          __info__: map,
          data: [Asana.Task.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get tasks from a user task list

  <b>Required scope: </b><code>tasks:read</code>

  Returns the compact list of tasks in a user’s My Tasks list.
  *Note: Access control is enforced for this endpoint as with all Asana API endpoints, meaning a user’s private tasks will be filtered out if the API-authenticated user does not have access to them.*
  *Note: Both complete and incomplete tasks are returned by default unless they are filtered out (for example, setting `completed_since=now` will return only incomplete tasks, which is the default view for “My Tasks” in Asana.)*

  ## Options

    * `completed_since`: Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*.
      
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_tasks_for_user_task_list(user_task_list_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.get_tasks_for_user_task_list_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_tasks_for_user_task_list(user_task_list_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:completed_since, :limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [user_task_list_gid: user_task_list_gid],
      call: {Asana.Tasks, :get_tasks_for_user_task_list},
      url: "/user_task_lists/#{user_task_list_gid}/tasks",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :get_tasks_for_user_task_list_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type remove_dependencies_for_task_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Unlink dependencies from a task

  <b>Required scope: </b><code>tasks:write</code>

  Unlinks a set of dependencies from this task.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The list of tasks to unlink as dependencies.
  """
  @spec remove_dependencies_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.remove_dependencies_for_task_200_json_resp()}
          | {:error, Asana.Error.t()}
  def remove_dependencies_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :remove_dependencies_for_task},
      url: "/tasks/#{task_gid}/removeDependencies",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :remove_dependencies_for_task_200_json_resp}},
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

  @type remove_dependents_for_task_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Unlink dependents from a task

  <b>Required scope: </b><code>tasks:write</code>

  Unlinks a set of dependents from this task.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The list of tasks to remove as dependents.
  """
  @spec remove_dependents_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.remove_dependents_for_task_200_json_resp()}
          | {:error, Asana.Error.t()}
  def remove_dependents_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :remove_dependents_for_task},
      url: "/tasks/#{task_gid}/removeDependents",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :remove_dependents_for_task_200_json_resp}},
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

  @type remove_follower_for_task_200_json_resp :: %{
          __info__: map,
          data: Asana.Task.response() | nil
        }

  @doc """
  Remove followers from a task

  <b>Required scope: </b><code>tasks:write</code>

  Removes each of the specified followers from the task if they are following. Returns the complete, updated record for the affected task.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The followers to remove from the task.
  """
  @spec remove_follower_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.remove_follower_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def remove_follower_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :remove_follower_for_task},
      url: "/tasks/#{task_gid}/removeFollowers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :remove_follower_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type remove_project_for_task_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Remove a project from a task

  <b>Required scope: </b><code>tasks:write</code>

  Removes the task from the specified project. The task will still exist in
  the system, but it will not be in the project anymore.

  Returns an empty data block.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The project to remove the task from.
  """
  @spec remove_project_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.remove_project_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def remove_project_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :remove_project_for_task},
      url: "/tasks/#{task_gid}/removeProject",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :remove_project_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type remove_tag_for_task_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Remove a tag from a task

  <b>Required scope: </b><code>tasks:write</code>

  Removes a tag from a task. Returns an empty data block.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The tag to remove from the task.
  """
  @spec remove_tag_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.remove_tag_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def remove_tag_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :remove_tag_for_task},
      url: "/tasks/#{task_gid}/removeTag",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :remove_tag_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type search_tasks_for_workspace_200_json_resp :: %{
          __info__: map,
          data: [Asana.Task.compact()] | nil
        }

  @doc """
  Search tasks in a workspace

  <b>Required scope: </b><code>tasks:read</code>

  To mirror the functionality of the Asana web app's advanced search feature, the Asana API has a task search endpoint that allows you to build complex filters to find and retrieve the exact data you need.
  #### Premium access
  Like the Asana web product's advance search feature, this search endpoint will only be available to premium Asana users. A user is premium if any of the following is true:

  - The workspace in which the search is being performed is a premium workspace - The user is a member of a premium team inside the workspace

  Even if a user is only a member of a premium team inside a non-premium workspace, search will allow them to find data anywhere in the workspace, not just inside the premium team. Making a search request using credentials of a non-premium user will result in a `402 Payment Required` error.
  #### Pagination
  Search results are not stable; repeating the same query multiple times may return the data in a different order, even if the data do not change. Because of this, the traditional [pagination](https://developers.asana.com/docs/#pagination) available elsewhere in the Asana API is not available here. However, you can paginate manually by sorting the search results by their creation time and then modifying each subsequent query to exclude data you have already seen. Page sizes are limited to a maximum of 100 items, and can be specified by the `limit` query parameter.
  #### Eventual consistency
  Changes in Asana (regardless of whether they’re made though the web product or the API) are forwarded to our search infrastructure to be indexed. This process can take between 10 and 60 seconds to complete under normal operation, and longer during some production incidents. Making a change to a task that would alter its presence in a particular search query will not be reflected immediately. This is also true of the advanced search feature in the web product.
  Because of this delay, the search endpoint is not suited for use cases that require immediate consistency after writes. If you need read-your-write behavior or strongly consistent results, we recommend using [Get multiple tasks](/reference/gettasks) instead.
  #### Rate limits
  You may receive a `429 Too Many Requests` response if you hit any of our [rate limits](https://developers.asana.com/docs/#rate-limits).
  #### Custom field parameters
  | Parameter name | Custom field type | Accepted type |
  |---|---|---|
  | custom_fields.{gid}.is_set | All | Boolean |
  | custom_fields.{gid}.value | Text | String |
  | custom_fields.{gid}.value | Number | Number |
  | custom_fields.{gid}.value | Enum | Enum option ID |
  | custom_fields.{gid}.starts_with | Text only | String |
  | custom_fields.{gid}.ends_with | Text only | String |
  | custom_fields.{gid}.contains | Text only | String |
  | custom_fields.{gid}.less_than | Number only | Number |
  | custom_fields.{gid}.greater_than | Number only | Number |

  For example, if the gid of the custom field is 12345, these query parameter to find tasks where it is set would be `custom_fields.12345.is_set=true`. To match an exact value for an enum custom field, use the gid of the desired enum option and not the name of the enum option: `custom_fields.12345.value=67890`.

  **Not Supported**: searching for multiple exact matches of a custom field, searching for multi-enum custom field

  *Note: If you specify `projects.any` and `sections.any`, you will receive tasks for the project **and** tasks for the section. If you're looking for only tasks in a section, omit the `projects.any` from the request.*

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `text`: Performs full-text search on both task name and description
    * `resource_subtype`: Filters results by the task's resource_subtype
    * `assignee.any`: Comma-separated list of user identifiers
    * `assignee.not`: Comma-separated list of user identifiers
    * `portfolios.any`: Comma-separated list of portfolio IDs
    * `projects.any`: Comma-separated list of project IDs
    * `projects.not`: Comma-separated list of project IDs
    * `projects.all`: Comma-separated list of project IDs
    * `sections.any`: Comma-separated list of section or column IDs
    * `sections.not`: Comma-separated list of section or column IDs
    * `sections.all`: Comma-separated list of section or column IDs
    * `tags.any`: Comma-separated list of tag IDs
    * `tags.not`: Comma-separated list of tag IDs
    * `tags.all`: Comma-separated list of tag IDs
    * `teams.any`: Comma-separated list of team IDs
    * `followers.any`: Comma-separated list of user identifiers
    * `followers.not`: Comma-separated list of user identifiers
    * `created_by.any`: Comma-separated list of user identifiers
    * `created_by.not`: Comma-separated list of user identifiers
    * `assigned_by.any`: Comma-separated list of user identifiers
    * `assigned_by.not`: Comma-separated list of user identifiers
    * `liked_by.not`: Comma-separated list of user identifiers
    * `commented_on_by.not`: Comma-separated list of user identifiers
    * `due_on.before`: ISO 8601 date string
    * `due_on.after`: ISO 8601 date string
    * `due_on`: ISO 8601 date string or `null`
    * `due_at.before`: ISO 8601 datetime string
    * `due_at.after`: ISO 8601 datetime string
    * `start_on.before`: ISO 8601 date string
    * `start_on.after`: ISO 8601 date string
    * `start_on`: ISO 8601 date string or `null`
    * `created_on.before`: ISO 8601 date string
    * `created_on.after`: ISO 8601 date string
    * `created_on`: ISO 8601 date string or `null`
    * `created_at.before`: ISO 8601 datetime string
    * `created_at.after`: ISO 8601 datetime string
    * `completed_on.before`: ISO 8601 date string
    * `completed_on.after`: ISO 8601 date string
    * `completed_on`: ISO 8601 date string or `null`
    * `completed_at.before`: ISO 8601 datetime string
    * `completed_at.after`: ISO 8601 datetime string
    * `modified_on.before`: ISO 8601 date string
    * `modified_on.after`: ISO 8601 date string
    * `modified_on`: ISO 8601 date string or `null`
    * `modified_at.before`: ISO 8601 datetime string
    * `modified_at.after`: ISO 8601 datetime string
    * `is_blocking`: Filter to incomplete tasks with dependents
    * `is_blocked`: Filter to tasks with incomplete dependencies
    * `has_attachment`: Filter to tasks with attachments
    * `completed`: Filter to completed tasks
    * `is_subtask`: Filter to subtasks
    * `sort_by`: One of `due_date`, `created_at`, `completed_at`, `likes`, or `modified_at`, defaults to `modified_at`
    * `sort_ascending`: Default `false`
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec search_tasks_for_workspace(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tasks.search_tasks_for_workspace_200_json_resp()}
          | {:error, Asana.Error.t()}
  def search_tasks_for_workspace(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"assigned_by.any",
        :"assigned_by.not",
        :"assignee.any",
        :"assignee.not",
        :"commented_on_by.not",
        :completed,
        :"completed_at.after",
        :"completed_at.before",
        :completed_on,
        :"completed_on.after",
        :"completed_on.before",
        :"created_at.after",
        :"created_at.before",
        :"created_by.any",
        :"created_by.not",
        :created_on,
        :"created_on.after",
        :"created_on.before",
        :"due_at.after",
        :"due_at.before",
        :due_on,
        :"due_on.after",
        :"due_on.before",
        :"followers.any",
        :"followers.not",
        :has_attachment,
        :is_blocked,
        :is_blocking,
        :is_subtask,
        :"liked_by.not",
        :"modified_at.after",
        :"modified_at.before",
        :modified_on,
        :"modified_on.after",
        :"modified_on.before",
        :opt_fields,
        :opt_pretty,
        :"portfolios.any",
        :"projects.all",
        :"projects.any",
        :"projects.not",
        :resource_subtype,
        :"sections.all",
        :"sections.any",
        :"sections.not",
        :sort_ascending,
        :sort_by,
        :start_on,
        :"start_on.after",
        :"start_on.before",
        :"tags.all",
        :"tags.any",
        :"tags.not",
        :"teams.any",
        :text
      ])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.Tasks, :search_tasks_for_workspace},
      url: "/workspaces/#{workspace_gid}/tasks/search",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tasks, :search_tasks_for_workspace_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type set_parent_for_task_200_json_resp :: %{__info__: map, data: Asana.Task.response() | nil}

  @doc """
  Set the parent of a task

  <b>Required scope: </b><code>tasks:write</code>

  Updates the parent of a given task. This endpoint can be used to make a task a subtask of another task, or to remove its existing parent.
  When using `insert_before` and `insert_after`, at most one of those two options can be specified, and they must already be subtasks of the parent.
  Returns the complete, updated record of the affected [task](/reference/tasks#/task).

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The new parent of the subtask.
  """
  @spec set_parent_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.set_parent_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def set_parent_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :set_parent_for_task},
      url: "/tasks/#{task_gid}/setParent",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :set_parent_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_task_200_json_resp :: %{__info__: map, data: Asana.Task.response() | nil}

  @doc """
  Update a task

  <b>Required scope: </b><code>tasks:write</code>

  A specific, existing task can be updated by making a PUT request on the
  URL for that task. Only the fields provided in the `data` block will be
  updated; any unspecified fields will remain unchanged.

  When using this method, it is best to specify only those fields you wish
  to change, or else you may overwrite changes made by another user since
  you last retrieved the task.

  Returns the complete updated task record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The task to update.
  """
  @spec update_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tasks.update_task_200_json_resp()} | {:error, Asana.Error.t()}
  def update_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Tasks, :update_task},
      url: "/tasks/#{task_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tasks, :update_task_200_json_resp}},
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
  def __fields__(:add_dependencies_for_task_200_json_resp) do
    [data: :map]
  end

  def __fields__(:add_dependents_for_task_200_json_resp) do
    [data: :map]
  end

  def __fields__(:add_followers_for_task_200_json_resp) do
    [data: {Asana.Task, :response}]
  end

  def __fields__(:add_project_for_task_200_json_resp) do
    [data: :map]
  end

  def __fields__(:add_tag_for_task_200_json_resp) do
    [data: :map]
  end

  def __fields__(:create_subtask_for_task_201_json_resp) do
    [data: {Asana.Task, :response}]
  end

  def __fields__(:create_task_201_json_resp) do
    [data: {Asana.Task, :response}]
  end

  def __fields__(:delete_task_200_json_resp) do
    [data: :map]
  end

  def __fields__(:duplicate_task_201_json_resp) do
    [data: {Asana.Job, :response}]
  end

  def __fields__(:get_dependencies_for_task_200_json_resp) do
    [data: [{Asana.Task, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_dependents_for_task_200_json_resp) do
    [data: [{Asana.Task, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_subtasks_for_task_200_json_resp) do
    [data: [{Asana.Task, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_task_200_json_resp) do
    [data: {Asana.Task, :response}]
  end

  def __fields__(:get_task_for_custom_id_200_json_resp) do
    [data: {Asana.Task, :response}]
  end

  def __fields__(:get_tasks_200_json_resp) do
    [data: [{Asana.Task, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_tasks_for_project_200_json_resp) do
    [data: [{Asana.Task, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_tasks_for_section_200_json_resp) do
    [data: [{Asana.Task, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_tasks_for_tag_200_json_resp) do
    [data: [{Asana.Task, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_tasks_for_user_task_list_200_json_resp) do
    [data: [{Asana.Task, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:remove_dependencies_for_task_200_json_resp) do
    [data: :map]
  end

  def __fields__(:remove_dependents_for_task_200_json_resp) do
    [data: :map]
  end

  def __fields__(:remove_follower_for_task_200_json_resp) do
    [data: {Asana.Task, :response}]
  end

  def __fields__(:remove_project_for_task_200_json_resp) do
    [data: :map]
  end

  def __fields__(:remove_tag_for_task_200_json_resp) do
    [data: :map]
  end

  def __fields__(:search_tasks_for_workspace_200_json_resp) do
    [data: [{Asana.Task, :compact}]]
  end

  def __fields__(:set_parent_for_task_200_json_resp) do
    [data: {Asana.Task, :response}]
  end

  def __fields__(:update_task_200_json_resp) do
    [data: {Asana.Task, :response}]
  end
end
