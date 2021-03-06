# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Api.CustomFields do
  @moduledoc """
  API calls for all endpoints tagged `CustomFields`.
  """

  alias Asana.Connection
  import Asana.RequestBuilder


  @doc """
  Create an enum option
  Creates an enum option and adds it to this custom field’s list of enum options. A custom field can have at most 50 enum options (including disabled options). By default new enum options are inserted at the end of a custom field’s list. Locked custom fields can only have enum options added by the user who locked the field. Returns the full record of the newly created enum option.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - custom_field_gid (integer()): Globally unique identifier for the custom field.
  - inline_object2 (InlineObject2): 
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.InlineResponse201.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec add_enum_option(Tesla.Env.client, integer(), Asana.Model.InlineObject2.t, keyword()) :: {:ok, Asana.Model.InlineResponse201.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def add_enum_option(connection, custom_field_gid, inline_object2, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:post)
    |> url("/custom_fields/#{custom_field_gid}/enum_options")
    |> add_param(:body, :body, inline_object2)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 201, %Asana.Model.InlineResponse201{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Create a custom field
  Creates a new custom field in a workspace. Every custom field is required to be created in a specific workspace, and this workspace cannot be changed once set.  A custom field’s name must be unique within a workspace and not conflict with names of existing task properties such as ‘Due Date’ or ‘Assignee’. A custom field’s type must be one of ‘text’, ‘enum’, or ‘number’.  Returns the full record of the newly created custom field.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - inline_object1 (InlineObject1): 
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.CustomFieldObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec create_custom_field(Tesla.Env.client, Asana.Model.InlineObject1.t, keyword()) :: {:ok, Asana.Model.CustomFieldObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def create_custom_field(connection, inline_object1, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:post)
    |> url("/custom_fields")
    |> add_param(:body, :body, inline_object1)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 201, %Asana.Model.CustomFieldObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Delete a custom field
  A specific, existing custom field can be deleted by making a DELETE request on the URL for that custom field. Locked custom fields can only be deleted by the user who locked the field. Returns an empty data record.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - custom_field_gid (integer()): Globally unique identifier for the custom field.
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
  @spec delete_custom_field(Tesla.Env.client, integer(), keyword()) :: {:ok, Asana.Model.EmptyObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def delete_custom_field(connection, custom_field_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:delete)
    |> url("/custom_fields/#{custom_field_gid}")
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
  Get a custom field definition
  Get the complete definition of a custom field’s metadata.  Since custom fields can be defined for one of a number of types, and these types have different data and behaviors, there are fields that are relevant to a particular type. For instance, as noted above, enum_options is only relevant for the enum type and defines the set of choices that the enum could represent. The examples below show some of these type-specific custom field definitions.  **Get the metadata for a custom field of type ‘text’**  ``` # Request curl -H \"Authorization: Bearer <personal_access_token>\" \\ https://app.asana.com/api/1.0/custom_fields/124578 ```  ``` # Response HTTP/1.1 200 {   \"data\": [     {       \"id\": 134679,       \"name\": \"Owner\",       \"description\": \"Person responsible for task\",       \"type\": \"text\"     }   ] } ```  **Get the metadata for a custom field of type ‘number’**  ``` # Request curl -H \"Authorization: Bearer <personal_access_token>\" \\ https://app.asana.com/api/1.0/custom_fields/124578 ```  ``` # Response HTTP/1.1 200 {   \"data\": [     {       \"id\": 938271,       \"name\": \"Price\",       \"description\": \"In US Dollars\",       \"type\": \"number\",       \"precision\": 2     }   ] } ```  **Get the metadata for a custom field when that field is of type ‘enum’.**  ``` # Request curl -H \"Authorization: Bearer <personal_access_token>\" \\ https://app.asana.com/api/1.0/custom_fields/124578 ```  ``` # Response HTTP/1.1 200 {   \"data\": [     {       \"id\": 124578,       \"name\": \"Priority\",       \"description\": \"Development team priority\",       \"type\": \"enum\",       \"enum_options\": [         {           \"id\": 789,           \"name\": \"Low\",           \"enabled\": true,           \"color\": \"blue\"         },         {           \"id\": 208,           \"name\": \"Medium\",           \"enabled\": false,           \"color\": \"yellow\"         },         {           \"id\": 439,           \"name\": \"High\",           \"enabled\": true,           \"color\": \"red\"         }       ]     }   ] } ```

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - custom_field_gid (integer()): Globally unique identifier for the custom field.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.CustomFieldObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_custom_field(Tesla.Env.client, integer(), keyword()) :: {:ok, Asana.Model.CustomFieldObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def get_custom_field(connection, custom_field_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/custom_fields/#{custom_field_gid}")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.CustomFieldObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Get a workspace's custom fields
  Returns a list of the compact representation of all of the custom fields in a workspace.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - workspace_gid (integer()): The workspace or organization to find custom field definitions in.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.CustomFieldArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_custom_fields_in_workspace(Tesla.Env.client, integer(), keyword()) :: {:ok, Asana.Model.CustomFieldArray.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def get_custom_fields_in_workspace(connection, workspace_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/workspaces/#{workspace_gid}/custom_fields")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.CustomFieldArray{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Add a custom field to a portfolio
  Custom fields are associated with portfolios by way of custom field settings.  This method creates a setting for the portfolio.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - portfolio_gid (String.t): Globally unique identifier for the portfolio.
  - custom_field (integer()): The custom field to associate with this portfolio.
  - opts (KeywordList): [optional] Optional parameters
    - :is_important (boolean()): Whether this field should be considered important to this portfolio (for instance, to display in the list view of items in the portfolio).
    - :insert_before (integer()): An id of a Custom Field Setting on this portfolio, before which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.
    - :insert_after (integer()): An id of a Custom Field Setting on this portfolio, after which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
  ## Returns

  {:ok, Asana.Model.EmptyObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec portfolio_add_custom_field_setting(Tesla.Env.client, String.t, integer(), keyword()) :: {:ok, Asana.Model.EmptyObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def portfolio_add_custom_field_setting(connection, portfolio_gid, custom_field, opts \\ []) do
    optional_params = %{
      :"is_important" => :query,
      :"insert_before" => :query,
      :"insert_after" => :query,
      :"opt_pretty" => :query
    }
    %{}
    |> method(:post)
    |> url("/portfolios/#{portfolio_gid}/addCustomFieldSetting")
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
  Remove a custom field from a portfolio
  Removes a custom field setting from a portfolio.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - portfolio_gid (String.t): Globally unique identifier for the portfolio.
  - custom_field (integer()): The custom field to remove from this portfolio.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
  ## Returns

  {:ok, Asana.Model.EmptyObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec portfolio_remove_custom_field_setting(Tesla.Env.client, String.t, integer(), keyword()) :: {:ok, Asana.Model.EmptyObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def portfolio_remove_custom_field_setting(connection, portfolio_gid, custom_field, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query
    }
    %{}
    |> method(:post)
    |> url("/portfolios/#{portfolio_gid}/removeCustomFieldSetting")
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
  Reorder a custom field's enum
  Moves a particular enum option to be either before or after another specified enum option in the custom field. Locked custom fields can only be reordered by the user who locked the field.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - custom_field_gid (integer()): Globally unique identifier for the custom field.
  - inline_object3 (InlineObject3): 
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.InlineResponse201.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec reorder_enum_option(Tesla.Env.client, integer(), Asana.Model.InlineObject3.t, keyword()) :: {:ok, Asana.Model.InlineResponse201.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def reorder_enum_option(connection, custom_field_gid, inline_object3, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:post)
    |> url("/custom_fields/#{custom_field_gid}/enum_options/insert")
    |> add_param(:body, :body, inline_object3)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.InlineResponse201{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Update a custom field
  A specific, existing custom field can be updated by making a PUT request on the URL for that custom field. Only the fields provided in the `data` block will be updated; any unspecified fields will remain unchanged When using this method, it is best to specify only those fields you wish to change, or else you may overwrite changes made by another user since you last retrieved the custom field. A custom field’s `type` cannot be updated. An enum custom field’s `enum_options` cannot be updated with this endpoint. Instead see “Work With Enum Options” for information on how to update `enum_options`. Locked custom fields can only be updated by the user who locked the field. Returns the complete updated custom field record.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - custom_field_gid (integer()): Globally unique identifier for the custom field.
  - custom_field_object (CustomFieldObject): The custom field object with all updated properties.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.CustomFieldObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec update_custom_field(Tesla.Env.client, integer(), Asana.Model.CustomFieldObject.t, keyword()) :: {:ok, Asana.Model.CustomFieldObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def update_custom_field(connection, custom_field_gid, custom_field_object, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:put)
    |> url("/custom_fields/#{custom_field_gid}")
    |> add_param(:body, :body, custom_field_object)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.CustomFieldObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Update an enum option.
  Updates an existing enum option. Enum custom fields require at least one enabled enum option. Locked custom fields can only be updated by the user who locked the field. Returns the full record of the updated enum option.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - enum_option_gid (integer()): Globally unique identifier for the enum option.
  - inline_object4 (InlineObject4): 
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.InlineObject4.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec update_enum_option(Tesla.Env.client, integer(), Asana.Model.InlineObject4.t, keyword()) :: {:ok, Asana.Model.InlineObject4.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def update_enum_option(connection, enum_option_gid, inline_object4, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:put)
    |> url("/enum_options/#{enum_option_gid}")
    |> add_param(:body, :body, inline_object4)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.InlineObject4{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end
end
