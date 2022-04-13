# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Api.UserTaskLists do
  @moduledoc """
  API calls for all endpoints tagged `UserTaskLists`.
  """

  alias Asana.Connection
  import Asana.RequestBuilder


  @doc """
  Get a user task list
  Returns the full record for a user task list.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - user_task_list_gid (String.t): Globally unique identifier for the user task list.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.UserTaskListObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_user_task_list(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.UserTaskListObject.t} | {:error, Tesla.Env.t}
  def get_user_task_list(connection, user_task_list_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/user_task_list/#{user_task_list_gid}")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.UserTaskListObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Get tasks in a user task list
  Returns the compact list of tasks in a user’s My Tasks list. The returned tasks will be in order within each assignee status group of `Inbox`, `Today`, and `Upcoming`. **Note:** tasks in `Later` have a different ordering in the Asana web app than the other assignee status groups; this endpoint will still return them in list order in `Later` (differently than they show up in Asana, but the same order as in Asana’s mobile apps). **Note:** Access control is enforced for this endpoint as with all Asana API endpoints, meaning a user’s private tasks will be filtered out if the API-authenticated user does not have access to them. **Note:** Both complete and incomplete tasks are returned by default unless they are filtered out (for example, setting `completed_since=now` will return only incomplete tasks, which is the default view for “My Tasks” in Asana.)

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - user_task_list_gid (String.t): Globally unique identifier for the user task list.
  - opts (KeywordList): [optional] Optional parameters
    - :completed_since (String.t): Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*. 
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.TaskArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_user_task_list_tasks(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.TaskArray.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def get_user_task_list_tasks(connection, user_task_list_gid, opts \\ []) do
    optional_params = %{
      :"completed_since" => :query,
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/user_task_lists/#{user_task_list_gid}/tasks")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.TaskArray{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Get a user's task list
  Returns the full record for a user's task list.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - user_gid (String.t): Globally unique identifier for the user.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.UserTaskListObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_users_task_list(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.UserTaskListObject.t} | {:error, Tesla.Env.t}
  def get_users_task_list(connection, user_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/users/#{user_gid}/user_task_list")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.UserTaskListObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end
end
