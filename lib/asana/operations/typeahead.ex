defmodule Asana.Typeahead do
  @moduledoc """
  Provides API endpoint related to typeahead
  """

  @default_client Asana.Client

  @type typeahead_for_workspace_200_json_resp :: %{
          __info__: map,
          data: [Asana.AsanaNamedResource.t()] | nil
        }

  @doc """
  Get objects via typeahead

  <b>Required scope: </b><code>workspace.typeahead:read</code>

  Retrieves objects in the workspace based via an auto-completion/typeahead
  search algorithm. This feature is meant to provide results quickly, so do
  not rely on this API to provide extremely accurate search results. The
  result set is limited to a single page of results with a maximum size, so
  you won’t be able to fetch large numbers of results.

  The typeahead search API provides search for objects from a single
  workspace. This endpoint should be used to query for objects when
  creating an auto-completion/typeahead search feature. This API is meant
  to provide results quickly and should not be relied upon for accurate or
  exhaustive search results. The results sets are limited in size and
  cannot be paginated.

  Queries return a compact representation of each object which is typically
  the gid and name fields. Interested in a specific set of fields or all of
  the fields?! Of course you are. Use field selectors to manipulate what
  data is included in a response.

  Resources with type `user` are returned in order of most contacted to
  least contacted. This is determined by task assignments, adding the user
  to projects, and adding the user as a follower to tasks, messages,
  etc.

  Resources with type `project` are returned in order of recency. This is
  determined when the user visits the project, is added to the project, and
  completes tasks in the project.

  Resources with type `task` are returned with priority placed on tasks
  the user is following, but no guarantee on the order of those tasks.

  Resources with type `project_template` are returned with priority
  placed on favorited project templates.

  Leaving the `query` string empty or omitted will give you results, still
  following the resource ordering above. This could be used to list users or
  projects that are relevant for the requesting user's api token.

  ## Options

    * `resource_type`: The type of values the typeahead should return. You can choose from one of the following: `custom_field`, `goal`, `project`, `project_template`, `portfolio`, `tag`, `task`, `team`, and `user`. Note that unlike in the names of endpoints, the types listed here are in singular form (e.g. `task`). Using multiple types is not yet supported.
    * `type`: *Deprecated: new integrations should prefer the resource_type field.*
    * `query`: The string that will be used to search for relevant objects. If an empty string is passed in, the API will return results.
    * `count`: The number of results to return. The default is 20 if this parameter is omitted, with a minimum of 1 and a maximum of 100. If there are fewer results found than requested, all will be returned.
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec typeahead_for_workspace(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Typeahead.typeahead_for_workspace_200_json_resp()}
          | {:error, Asana.Error.t()}
  def typeahead_for_workspace(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:count, :opt_fields, :opt_pretty, :query, :resource_type, :type])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.Typeahead, :typeahead_for_workspace},
      url: "/workspaces/#{workspace_gid}/typeahead",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Typeahead, :typeahead_for_workspace_200_json_resp}},
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
  def __fields__(:typeahead_for_workspace_200_json_resp) do
    [data: [{Asana.AsanaNamedResource, :t}]]
  end
end
