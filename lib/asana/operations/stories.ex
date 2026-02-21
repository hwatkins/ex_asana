defmodule Asana.Stories do
  @moduledoc """
  Provides API endpoints related to stories
  """

  @default_client Asana.Client

  @type create_story_for_task_201_json_resp :: %{
          __info__: map,
          data: Asana.Story.response() | nil
        }

  @doc """
  Create a story on a task

  <b>Required scope: </b><code>stories:write</code>

  Adds a story to a task. This endpoint currently only allows for comment
  stories to be created. The comment will be authored by the currently
  authenticated user, and timestamped when the server receives the request.

  Returns the full record for the new story added to the task.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The story to create.
  """
  @spec create_story_for_task(task_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Stories.create_story_for_task_201_json_resp()} | {:error, Asana.Error.t()}
  def create_story_for_task(task_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid, body: body],
      call: {Asana.Stories, :create_story_for_task},
      url: "/tasks/#{task_gid}/stories",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Stories, :create_story_for_task_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type delete_story_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a story

  Deletes a story. A user can only delete stories they have created.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_story(story_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Stories.delete_story_200_json_resp()} | {:error, Asana.Error.t()}
  def delete_story(story_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [story_gid: story_gid],
      call: {Asana.Stories, :delete_story},
      url: "/stories/#{story_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Stories, :delete_story_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_stories_for_task_200_json_resp :: %{
          __info__: map,
          data: [Asana.Story.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get stories from a task

  <b>Required scope: </b><code>stories:read</code>

  Returns the compact records for all stories on the task.

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
  @spec get_stories_for_task(task_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Stories.get_stories_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def get_stories_for_task(task_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid],
      call: {Asana.Stories, :get_stories_for_task},
      url: "/tasks/#{task_gid}/stories",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Stories, :get_stories_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_story_200_json_resp :: %{__info__: map, data: Asana.Story.response() | nil}

  @doc """
  Get a story

  <b>Required scope: </b><code>stories:read</code>

  <table>
    <tr>
      <th>Field</th>
      <th>Required Scope</th>
    </tr>
    <tr>
      <td><code>previews</code></td>
      <td><code>attachments:read</code></td>
    </tr>
    <tr>
      <td><code>attachments</code></td>
      <td><code>attachments:read</code></td>
    </tr>
  </table>

  Returns the full record for a single story.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_story(story_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Stories.get_story_200_json_resp()} | {:error, Asana.Error.t()}
  def get_story(story_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [story_gid: story_gid],
      call: {Asana.Stories, :get_story},
      url: "/stories/#{story_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Stories, :get_story_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_story_200_json_resp :: %{__info__: map, data: Asana.Story.response() | nil}

  @doc """
  Update a story

  <b>Required scope: </b><code>stories:write</code>

  Updates the story and returns the full record for the updated story. Only comment stories can have their text updated, and only comment stories and attachment stories can be pinned. Only one of `text` and `html_text` can be specified.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The comment story to update.
  """
  @spec update_story(story_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Stories.update_story_200_json_resp()} | {:error, Asana.Error.t()}
  def update_story(story_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [story_gid: story_gid, body: body],
      call: {Asana.Stories, :update_story},
      url: "/stories/#{story_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Stories, :update_story_200_json_resp}},
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
  def __fields__(:create_story_for_task_201_json_resp) do
    [data: {Asana.Story, :response}]
  end

  def __fields__(:delete_story_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_stories_for_task_200_json_resp) do
    [data: [{Asana.Story, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_story_200_json_resp) do
    [data: {Asana.Story, :response}]
  end

  def __fields__(:update_story_200_json_resp) do
    [data: {Asana.Story, :response}]
  end
end
