defmodule Asana.Tags do
  @moduledoc """
  Provides API endpoints related to tags
  """

  @default_client Asana.Client

  @type create_tag_201_json_resp :: %{__info__: map, data: Asana.Tag.response() | nil}

  @doc """
  Create a tag

  <b>Required scope: </b><code>tags:write</code>

  Creates a new tag in a workspace or organization.

  Every tag is required to be created in a specific workspace or
  organization, and this cannot be changed once set. Note that you can use
  the workspace parameter regardless of whether or not it is an
  organization.

  Returns the full record of the newly created tag.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The tag to create.
  """
  @spec create_tag(body :: map, opts :: keyword) ::
          {:ok, Asana.Tags.create_tag_201_json_resp()} | {:error, Asana.Error.t()}
  def create_tag(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Tags, :create_tag},
      url: "/tags",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Tags, :create_tag_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type create_tag_for_workspace_201_json_resp :: %{
          __info__: map,
          data: Asana.Tag.response() | nil
        }

  @doc """
  Create a tag in a workspace

  <b>Required scope: </b><code>tags:write</code>

  Creates a new tag in a workspace or organization.

  Every tag is required to be created in a specific workspace or
  organization, and this cannot be changed once set. Note that you can use
  the workspace parameter regardless of whether or not it is an
  organization.

  Returns the full record of the newly created tag.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The tag to create.
  """
  @spec create_tag_for_workspace(workspace_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tags.create_tag_for_workspace_201_json_resp()} | {:error, Asana.Error.t()}
  def create_tag_for_workspace(workspace_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid, body: body],
      call: {Asana.Tags, :create_tag_for_workspace},
      url: "/workspaces/#{workspace_gid}/tags",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Tags, :create_tag_for_workspace_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type delete_tag_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a tag

  A specific, existing tag can be deleted by making a DELETE request on
  the URL for that tag.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_tag(tag_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tags.delete_tag_200_json_resp()} | {:error, Asana.Error.t()}
  def delete_tag(tag_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [tag_gid: tag_gid],
      call: {Asana.Tags, :delete_tag},
      url: "/tags/#{tag_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Tags, :delete_tag_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_tag_200_json_resp :: %{__info__: map, data: Asana.Tag.response() | nil}

  @doc """
  Get a tag

  <b>Required scope: </b><code>tags:read</code>

  Returns the complete tag record for a single tag.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_tag(tag_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tags.get_tag_200_json_resp()} | {:error, Asana.Error.t()}
  def get_tag(tag_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [tag_gid: tag_gid],
      call: {Asana.Tags, :get_tag},
      url: "/tags/#{tag_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tags, :get_tag_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_tags_200_json_resp :: %{
          __info__: map,
          data: [Asana.Tag.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get multiple tags

  <b>Required scope: </b><code>tags:read</code>

  Returns the compact tag records for some filtered set of tags. Use one or more of the parameters provided to filter the tags returned.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `workspace`: The workspace to filter tags on.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_tags(opts :: keyword) ::
          {:ok, Asana.Tags.get_tags_200_json_resp()} | {:error, Asana.Error.t()}
  def get_tags(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :workspace])

    client.request(%{
      args: [],
      call: {Asana.Tags, :get_tags},
      url: "/tags",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tags, :get_tags_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_tags_for_task_200_json_resp :: %{
          __info__: map,
          data: [Asana.Tag.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get a task's tags

  <b>Required scope: </b><code>tags:read</code>

  Get a compact representation of all of the tags the task has.

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
  @spec get_tags_for_task(task_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tags.get_tags_for_task_200_json_resp()} | {:error, Asana.Error.t()}
  def get_tags_for_task(task_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [task_gid: task_gid],
      call: {Asana.Tags, :get_tags_for_task},
      url: "/tasks/#{task_gid}/tags",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tags, :get_tags_for_task_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_tags_for_workspace_200_json_resp :: %{
          __info__: map,
          data: [Asana.Tag.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get tags in a workspace

  <b>Required scope: </b><code>tags:read</code>

  Returns the compact tag records for some filtered set of tags. Use one or more of the parameters provided to filter the tags returned.

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
  @spec get_tags_for_workspace(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Tags.get_tags_for_workspace_200_json_resp()} | {:error, Asana.Error.t()}
  def get_tags_for_workspace(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.Tags, :get_tags_for_workspace},
      url: "/workspaces/#{workspace_gid}/tags",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Tags, :get_tags_for_workspace_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_tag_200_json_resp :: %{__info__: map, data: Asana.Tag.response() | nil}

  @doc """
  Update a tag

  <b>Required scope: </b><code>tags:write</code>

  Updates the properties of a tag. Only the fields provided in the `data`
  block will be updated; any unspecified fields will remain unchanged.

  When using this method, it is best to specify only those fields you wish
  to change, or else you may overwrite changes made by another user since
  you last retrieved the tag.

  Returns the complete updated tag record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The tag to update.
  """
  @spec update_tag(tag_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Tags.update_tag_200_json_resp()} | {:error, Asana.Error.t()}
  def update_tag(tag_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [tag_gid: tag_gid, body: body],
      call: {Asana.Tags, :update_tag},
      url: "/tags/#{tag_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Tags, :update_tag_200_json_resp}},
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
  def __fields__(:create_tag_201_json_resp) do
    [data: {Asana.Tag, :response}]
  end

  def __fields__(:create_tag_for_workspace_201_json_resp) do
    [data: {Asana.Tag, :response}]
  end

  def __fields__(:delete_tag_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_tag_200_json_resp) do
    [data: {Asana.Tag, :response}]
  end

  def __fields__(:get_tags_200_json_resp) do
    [data: [{Asana.Tag, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_tags_for_task_200_json_resp) do
    [data: [{Asana.Tag, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_tags_for_workspace_200_json_resp) do
    [data: [{Asana.Tag, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:update_tag_200_json_resp) do
    [data: {Asana.Tag, :response}]
  end
end
