# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Api.Projects do
  @moduledoc """
  API calls for all endpoints tagged `Projects`.
  """

  alias Asana.Connection
  import Asana.RequestBuilder


  @doc """
  Create a new project
  Create a new project in a workspace or team.  Every project is required to be created in a specific workspace or organization, and this cannot be changed once set. Note that you can use the `workspace` parameter regardless of whether or not it is an organization.  If the workspace for your project is an organization, you must also supply a `team` to share the project with.  Returns the full record of the newly created project.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - inline_object7 (InlineObject7): 
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.ProjectArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec create_project(Tesla.Env.client, Asana.Model.InlineObject7.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectArray.t} | {:error, Tesla.Env.t}
  def create_project(connection, inline_object7, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:post)
    |> url("/projects")
    |> add_param(:body, :body, inline_object7)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 201, %Asana.Model.ProjectArray{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Create a project status
  Creates a new status update on the project. Returns the full record of the newly created project status update.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - project_gid (integer()): The project to get statuses from.
  - inline_object6 (InlineObject6): 
  - opts (KeywordList): [optional] Optional parameters
  ## Returns

  {:ok, Asana.Model.ProjectStatusObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec create_project_status(Tesla.Env.client, integer(), Asana.Model.InlineObject6.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectStatusObject.t} | {:error, Tesla.Env.t}
  def create_project_status(connection, project_gid, inline_object6, _opts \\ []) do
    %{}
    |> method(:post)
    |> url("/projects/#{project_gid}/project_statuses")
    |> add_param(:body, :body, inline_object6)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 201, %Asana.Model.ProjectStatusObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Create a project in a workspace
  Returns the compact project records for all projects in the workspace.  If the workspace for your project is an organization, you must also supply a team to share the project with.  Returns the full record of the newly created project.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - workspace_gid (String.t): Globally unique identifier for the workspace or organization.
  - project_object (ProjectObject): The new project to create.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.ProjectObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec create_projects_in_workspace(Tesla.Env.client, String.t, Asana.Model.ProjectObject.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectObject.t} | {:error, Tesla.Env.t}
  def create_projects_in_workspace(connection, workspace_gid, project_object, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:post)
    |> url("/workspaces/#{workspace_gid}/projects")
    |> add_param(:body, :body, project_object)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 201, %Asana.Model.ProjectObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Create a project in a team
  Creates a project shared with the given team.  Returns the full record of the newly created project.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - team_gid (String.t): Globally unique identifier for the team.
  - project_object (ProjectObject): The new project to create.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.ProjectObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec create_projects_with_team(Tesla.Env.client, String.t, Asana.Model.ProjectObject.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectObject.t} | {:error, Tesla.Env.t}
  def create_projects_with_team(connection, team_gid, project_object, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:post)
    |> url("/teams/#{team_gid}/projects")
    |> add_param(:body, :body, project_object)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 201, %Asana.Model.ProjectObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Delete a project
  A specific, existing project can be deleted by making a DELETE request on the URL for that project.  Returns an empty data record.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - project_gid (String.t): Globally unique identifier for the project.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.EmptyObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec delete_project(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.EmptyObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def delete_project(connection, project_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:delete)
    |> url("/projects/#{project_gid}")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.EmptyObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Get a project's statuses
  Returns the compact project status update records for all updates on the project.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - project_gid (integer()): The project to get statuses from.
  - opts (KeywordList): [optional] Optional parameters
  ## Returns

  {:ok, Asana.Model.ProjectStatusArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_product_statuses(Tesla.Env.client, integer(), keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectStatusArray.t} | {:error, Tesla.Env.t}
  def get_product_statuses(connection, project_gid, _opts \\ []) do
    %{}
    |> method(:get)
    |> url("/projects/#{project_gid}/project_statuses")
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.ProjectStatusArray{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Get a project
  Returns the complete project record for a single project.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - project_gid (String.t): Globally unique identifier for the project.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.ProjectObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_project(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectObject.t} | {:error, Tesla.Env.t}
  def get_project(connection, project_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/projects/#{project_gid}")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.ProjectObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Get a project's tasks
  Returns the compact task records for all tasks within the given project, ordered by their priority within the project. Tasks can exist in more than one project at a time.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - project_gid (String.t): Globally unique identifier for the project.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.TaskArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_project_tasks(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.TaskArray.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def get_project_tasks(connection, project_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/projects/#{project_gid}/tasks")
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
  Get a set of projects
  Returns the compact project records for some filtered set of projects. Use one or more of the parameters provided to filter the projects returned.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
    - :workspace (integer()): The workspace or organization to filter projects on.
    - :team (integer()): The team to filter projects on.
    - :archived (boolean()): Only return projects whose `archived` field takes on the value of this parameter.
  ## Returns

  {:ok, Asana.Model.ProjectArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_projects(Tesla.Env.client, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectArray.t} | {:error, Tesla.Env.t}
  def get_projects(connection, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query,
      :"workspace" => :query,
      :"team" => :query,
      :"archived" => :query
    }
    %{}
    |> method(:get)
    |> url("/projects")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.ProjectArray{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Get a team's projects
  Returns the compact project records for all projects in the team.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - team_gid (String.t): Globally unique identifier for the team.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
    - :archived (boolean()): Only return projects whose `archived` field takes on the value of this parameter.
  ## Returns

  {:ok, Asana.Model.ProjectArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_projects_in_team(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectArray.t} | {:error, Tesla.Env.t}
  def get_projects_in_team(connection, team_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query,
      :"archived" => :query
    }
    %{}
    |> method(:get)
    |> url("/teams/#{team_gid}/projects")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.ProjectArray{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Get all projects in a workspace
  Returns the compact project records for all projects in the workspace.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - workspace_gid (String.t): Globally unique identifier for the workspace or organization.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
    - :archived (boolean()): Only return projects whose `archived` field takes on the value of this parameter.
  ## Returns

  {:ok, Asana.Model.ProjectArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_projects_in_workspace(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectArray.t} | {:error, Tesla.Env.t}
  def get_projects_in_workspace(connection, workspace_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query,
      :"archived" => :query
    }
    %{}
    |> method(:get)
    |> url("/workspaces/#{workspace_gid}/projects")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.ProjectArray{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Add a custom field to a project
  Custom fields are associated with projects by way of custom field settings.  This method creates a setting for the project.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - project_gid (String.t): Globally unique identifier for the project.
  - custom_field (integer()): The custom field to associate with this project.
  - opts (KeywordList): [optional] Optional parameters
    - :is_important (boolean()): Whether this field should be considered \"important\" to this project. This may cause it to be displayed more prominently, for example in the task grid.
    - :insert_before (integer()): An id of a Custom Field Setting on this project, before which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.
    - :insert_after (integer()): An id of a Custom Field Setting on this project, after which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
  ## Returns

  {:ok, Asana.Model.EmptyObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec project_add_custom_field_setting(Tesla.Env.client, String.t, integer(), keyword()) :: {:ok, Asana.Model.EmptyObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def project_add_custom_field_setting(connection, project_gid, custom_field, opts \\ []) do
    optional_params = %{
      :"is_important" => :query,
      :"insert_before" => :query,
      :"insert_after" => :query,
      :"opt_pretty" => :query
    }
    %{}
    |> method(:post)
    |> url("/projects/#{project_gid}/addCustomFieldSetting")
    |> add_param(:query, :"custom_field", custom_field)
    |> add_optional_params(optional_params, opts)
    |> ensure_body()
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.EmptyObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Remove a custom field from a project
  Removes a custom field setting from a project.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - project_gid (String.t): Globally unique identifier for the project.
  - custom_field (integer()): The custom field to remove from this project.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
  ## Returns

  {:ok, Asana.Model.EmptyObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec project_remove_custom_field_setting(Tesla.Env.client, String.t, integer(), keyword()) :: {:ok, Asana.Model.EmptyObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def project_remove_custom_field_setting(connection, project_gid, custom_field, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query
    }
    %{}
    |> method(:post)
    |> url("/projects/#{project_gid}/removeCustomFieldSetting")
    |> add_param(:query, :"custom_field", custom_field)
    |> add_optional_params(optional_params, opts)
    |> ensure_body()
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.EmptyObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Update a project
  A specific, existing project can be updated by making a PUT request on the URL for that project. Only the fields provided in the `data` block will be updated; any unspecified fields will remain unchanged.  When using this method, it is best to specify only those fields you wish to change, or else you may overwrite changes made by another user since you last retrieved the task.  Returns the complete updated project record.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - project_gid (String.t): Globally unique identifier for the project.
  - project_object (ProjectObject): The updated fields for the project.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.ProjectObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec update_project(Tesla.Env.client, String.t, Asana.Model.ProjectObject.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.ProjectObject.t} | {:error, Tesla.Env.t}
  def update_project(connection, project_gid, project_object, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:put)
    |> url("/projects/#{project_gid}")
    |> add_param(:body, :body, project_object)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.ProjectObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end
end
