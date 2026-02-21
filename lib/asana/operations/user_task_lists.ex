defmodule Asana.UserTaskLists do
  @moduledoc """
  Provides API endpoints related to user task lists
  """

  @default_client Asana.Client

  @doc """
  Get a user task list

  <b>Required scope: </b><code>tasks:read</code>

  Returns the full record for a user task list.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_user_task_list(user_task_list_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.User.TaskLists.get_user_task_list_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_user_task_list(user_task_list_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [user_task_list_gid: user_task_list_gid],
      call: {Asana.UserTaskLists, :get_user_task_list},
      url: "/user_task_lists/#{user_task_list_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.User.TaskLists, :get_user_task_list_200_json_resp}},
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
  Get a user's task list

  <b>Required scope: </b><code>tasks:read</code>

  Returns the full record for a user's task list.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `workspace`: The workspace in which to get the user task list.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_user_task_list_for_user(user_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.User.TaskLists.get_user_task_list_for_user_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_user_task_list_for_user(user_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty, :workspace])

    client.request(%{
      args: [user_gid: user_gid],
      call: {Asana.UserTaskLists, :get_user_task_list_for_user},
      url: "/users/#{user_gid}/user_task_list",
      method: :get,
      query: query,
      response: [
        {200, {Asana.User.TaskLists, :get_user_task_list_for_user_200_json_resp}},
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
