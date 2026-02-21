defmodule Asana.Goals do
  @moduledoc """
  Provides API endpoints related to goals
  """

  @default_client Asana.Client

  @type add_custom_field_setting_for_goal_200_json_resp :: %{
          __info__: map,
          data: Asana.CustomField.Setting.response() | nil
        }

  @doc """
  Add a custom field to a goal

  <b>Required scope: </b><code>goals:write</code>

  Custom fields are associated with goals by way of custom field settings.  This method creates a setting for the goal.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  Information about the custom field setting.
  """
  @spec add_custom_field_setting_for_goal(goal_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Goals.add_custom_field_setting_for_goal_200_json_resp()}
          | {:error, Asana.Error.t()}
  def add_custom_field_setting_for_goal(goal_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid, body: body],
      call: {Asana.Goals, :add_custom_field_setting_for_goal},
      url: "/goals/#{goal_gid}/addCustomFieldSetting",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Goals, :add_custom_field_setting_for_goal_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type add_followers_200_json_resp :: %{__info__: map, data: Asana.Goal.response() | nil}

  @doc """
  Add a collaborator to a goal

  Adds followers to a goal. Returns the goal the followers were added to.
  Each goal can be associated with zero or more followers in the system.
  Requests to add/remove followers, if successful, will return the complete updated goal record, described above.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The followers to be added as collaborators
  """
  @spec add_followers(goal_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Goals.add_followers_200_json_resp()} | {:error, Asana.Error.t()}
  def add_followers(goal_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid, body: body],
      call: {Asana.Goals, :add_followers},
      url: "/goals/#{goal_gid}/addFollowers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Goals, :add_followers_200_json_resp}},
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

  @type create_goal_201_json_resp :: %{__info__: map, data: Asana.Goal.response() | nil}

  @doc """
  Create a goal

  Creates a new goal in a workspace or team.

  Returns the full record of the newly created goal.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The goal to create.
  """
  @spec create_goal(body :: map, opts :: keyword) ::
          {:ok, Asana.Goals.create_goal_201_json_resp()} | {:error, Asana.Error.t()}
  def create_goal(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Goals, :create_goal},
      url: "/goals",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Goals, :create_goal_201_json_resp}},
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

  @type create_goal_metric_200_json_resp :: %{__info__: map, data: Asana.Goal.response() | nil}

  @doc """
  Create a goal metric

  Creates and adds a goal metric to a specified goal. Note that this replaces an existing goal metric if one already exists.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The goal metric to create.
  """
  @spec create_goal_metric(goal_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Goals.create_goal_metric_200_json_resp()} | {:error, Asana.Error.t()}
  def create_goal_metric(goal_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid, body: body],
      call: {Asana.Goals, :create_goal_metric},
      url: "/goals/#{goal_gid}/setMetric",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Goals, :create_goal_metric_200_json_resp}},
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

  @type delete_goal_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a goal

  A specific, existing goal can be deleted by making a DELETE request on the URL for that goal.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_goal(goal_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Goals.delete_goal_200_json_resp()} | {:error, Asana.Error.t()}
  def delete_goal(goal_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid],
      call: {Asana.Goals, :delete_goal},
      url: "/goals/#{goal_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Goals, :delete_goal_200_json_resp}},
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

  @type get_goal_200_json_resp :: %{__info__: map, data: Asana.Goal.response() | nil}

  @doc """
  Get a goal

  <b>Required scope: </b><code>goals:read</code>

  <table>
    <tr>
      <th>Field</th>
      <th>Required Scope</th>
    </tr>
    <tr>
      <td><code>time_period</code></td>
      <td><code>time_periods:read</code></td>
    </tr>
  </table>

  Returns the complete goal record for a single goal.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_goal(goal_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Goals.get_goal_200_json_resp()} | {:error, Asana.Error.t()}
  def get_goal(goal_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid],
      call: {Asana.Goals, :get_goal},
      url: "/goals/#{goal_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Goals, :get_goal_200_json_resp}},
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

  @type get_goals_200_json_resp :: %{
          __info__: map,
          data: [Asana.Goal.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get goals

  <b>Required scope: </b><code>goals:read</code>

  Returns compact goal records.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `portfolio`: Globally unique identifier for supporting portfolio.
    * `project`: Globally unique identifier for supporting project.
    * `task`: Globally unique identifier for supporting task.
    * `is_workspace_level`: Filter to goals with is_workspace_level set to query value. Must be used with the workspace parameter.
    * `team`: Globally unique identifier for the team.
    * `workspace`: Globally unique identifier for the workspace.
    * `time_periods`: Globally unique identifiers for the time periods.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_goals(opts :: keyword) ::
          {:ok, Asana.Goals.get_goals_200_json_resp()} | {:error, Asana.Error.t()}
  def get_goals(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :is_workspace_level,
        :limit,
        :offset,
        :opt_fields,
        :opt_pretty,
        :portfolio,
        :project,
        :task,
        :team,
        :time_periods,
        :workspace
      ])

    client.request(%{
      args: [],
      call: {Asana.Goals, :get_goals},
      url: "/goals",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Goals, :get_goals_200_json_resp}},
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

  @type get_parent_goals_for_goal_200_json_resp :: %{
          __info__: map,
          data: [Asana.Goal.compact()] | nil
        }

  @doc """
  Get parent goals from a goal

  <b>Required scope: </b><code>goals:read</code>

  Returns a compact representation of all of the parent goals of a goal.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_parent_goals_for_goal(goal_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Goals.get_parent_goals_for_goal_200_json_resp()} | {:error, Asana.Error.t()}
  def get_parent_goals_for_goal(goal_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid],
      call: {Asana.Goals, :get_parent_goals_for_goal},
      url: "/goals/#{goal_gid}/parentGoals",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Goals, :get_parent_goals_for_goal_200_json_resp}},
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

  @type remove_custom_field_setting_for_goal_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Remove a custom field from a goal

  <b>Required scope: </b><code>goals:write</code>

  Removes a custom field setting from a goal.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  Information about the custom field setting being removed.
  """
  @spec remove_custom_field_setting_for_goal(goal_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Goals.remove_custom_field_setting_for_goal_200_json_resp()}
          | {:error, Asana.Error.t()}
  def remove_custom_field_setting_for_goal(goal_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid, body: body],
      call: {Asana.Goals, :remove_custom_field_setting_for_goal},
      url: "/goals/#{goal_gid}/removeCustomFieldSetting",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Goals, :remove_custom_field_setting_for_goal_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type remove_followers_200_json_resp :: %{__info__: map, data: Asana.Goal.response() | nil}

  @doc """
  Remove a collaborator from a goal

  Removes followers from a goal. Returns the goal the followers were removed from.
  Each goal can be associated with zero or more followers in the system.
  Requests to add/remove followers, if successful, will return the complete updated goal record, described above.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The followers to be removed as collaborators
  """
  @spec remove_followers(goal_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Goals.remove_followers_200_json_resp()} | {:error, Asana.Error.t()}
  def remove_followers(goal_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid, body: body],
      call: {Asana.Goals, :remove_followers},
      url: "/goals/#{goal_gid}/removeFollowers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Goals, :remove_followers_200_json_resp}},
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

  @type update_goal_200_json_resp :: %{__info__: map, data: Asana.Goal.response() | nil}

  @doc """
  Update a goal

  An existing goal can be updated by making a PUT request on the URL for
  that goal. Only the fields provided in the `data` block will be updated;
  any unspecified fields will remain unchanged.

  Returns the complete updated goal record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the goal.
  """
  @spec update_goal(goal_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Goals.update_goal_200_json_resp()} | {:error, Asana.Error.t()}
  def update_goal(goal_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid, body: body],
      call: {Asana.Goals, :update_goal},
      url: "/goals/#{goal_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Goals, :update_goal_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_goal_metric_200_json_resp :: %{__info__: map, data: Asana.Goal.response() | nil}

  @doc """
  Update a goal metric

  Updates a goal's existing metric's `current_number_value` if one exists,
  otherwise responds with a 400 status code.

  Returns the complete updated goal metric record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the goal metric.
  """
  @spec update_goal_metric(goal_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Goals.update_goal_metric_200_json_resp()} | {:error, Asana.Error.t()}
  def update_goal_metric(goal_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid, body: body],
      call: {Asana.Goals, :update_goal_metric},
      url: "/goals/#{goal_gid}/setMetricCurrentValue",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Goals, :update_goal_metric_200_json_resp}},
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

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_custom_field_setting_for_goal_200_json_resp) do
    [data: {Asana.CustomField.Setting, :response}]
  end

  def __fields__(:add_followers_200_json_resp) do
    [data: {Asana.Goal, :response}]
  end

  def __fields__(:create_goal_201_json_resp) do
    [data: {Asana.Goal, :response}]
  end

  def __fields__(:create_goal_metric_200_json_resp) do
    [data: {Asana.Goal, :response}]
  end

  def __fields__(:delete_goal_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_goal_200_json_resp) do
    [data: {Asana.Goal, :response}]
  end

  def __fields__(:get_goals_200_json_resp) do
    [data: [{Asana.Goal, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_parent_goals_for_goal_200_json_resp) do
    [data: [{Asana.Goal, :compact}]]
  end

  def __fields__(:remove_custom_field_setting_for_goal_200_json_resp) do
    [data: :map]
  end

  def __fields__(:remove_followers_200_json_resp) do
    [data: {Asana.Goal, :response}]
  end

  def __fields__(:update_goal_200_json_resp) do
    [data: {Asana.Goal, :response}]
  end

  def __fields__(:update_goal_metric_200_json_resp) do
    [data: {Asana.Goal, :response}]
  end
end
