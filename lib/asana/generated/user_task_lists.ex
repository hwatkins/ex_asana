defmodule Asana.Generated.UserTaskLists do
  @moduledoc """
  Provides API endpoints related to user task lists
  """

  @default_client Asana.OperationClient

  @type get_user_task_list_200_json_resp :: %{
          data: Asana.Generated.UserTaskListResponse.t() | nil
        }

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
          {:ok, Asana.Generated.UserTaskLists.get_user_task_list_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_user_task_list(user_task_list_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [user_task_list_gid: user_task_list_gid],
      call: {Asana.Generated.UserTaskLists, :get_user_task_list},
      url: "/user_task_lists/#{user_task_list_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.UserTaskLists, :get_user_task_list_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_user_task_list_for_user_200_json_resp :: %{
          data: Asana.Generated.UserTaskListResponse.t() | nil
        }

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
          {:ok, Asana.Generated.UserTaskLists.get_user_task_list_for_user_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_user_task_list_for_user(user_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty, :workspace])

    client.request(%{
      args: [user_gid: user_gid],
      call: {Asana.Generated.UserTaskLists, :get_user_task_list_for_user},
      url: "/users/#{user_gid}/user_task_list",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.UserTaskLists, :get_user_task_list_for_user_200_json_resp}},
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
  def __fields__(:get_user_task_list_200_json_resp) do
    [data: {Asana.Generated.UserTaskListResponse, :t}]
  end

  def __fields__(:get_user_task_list_for_user_200_json_resp) do
    [data: {Asana.Generated.UserTaskListResponse, :t}]
  end
end
