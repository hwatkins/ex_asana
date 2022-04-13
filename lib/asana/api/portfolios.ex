# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Api.Portfolios do
  @moduledoc """
  API calls for all endpoints tagged `Portfolios`.
  """

  alias Asana.Connection
  import Asana.RequestBuilder


  @doc """
  Add a portfolio item
  Add an item (project) to a portfolio. Returns an empty data block.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - portfolio_gid (String.t): Globally unique identifier for the portfolio.
  - item (String.t): The item (project) to add to the portfolio.
  - insert_before (String.t): An id of an item (project) in this portfolio. The new item will be added before the one specified here. `insert_before` and `insert_after` parameters cannot both be specified.
  - insert_after (String.t): An id of an item (project) in this portfolio. The new item will be added after the one specified here. `insert_before` and `insert_after` parameters cannot both be specified.
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
  @spec add_portfolio_item(Tesla.Env.client, String.t, String.t, String.t, String.t, keyword()) :: {:ok, Asana.Model.EmptyObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def add_portfolio_item(connection, portfolio_gid, item, insert_before, insert_after, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:post)
    |> url("/portfolios/#{portfolio_gid}/addItem")
    |> add_param(:query, :"item", item)
    |> add_param(:query, :"insert_before", insert_before)
    |> add_param(:query, :"insert_after", insert_after)
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
  Create a new portfolio
  Creates a new portfolio in the given workspace with the supplied name.  Note that portfolios created in the Asana UI may have some state (like the “Priority” custom field) which is automatically added to the portfolio when it is created. Portfolios created via our API will **not** be created with the same initial state to allow integrations to create their own starting state on a portfolio.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - portfolio_object (PortfolioObject): The portfolio to create.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.PortfolioArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec create_portfolio(Tesla.Env.client, Asana.Model.PortfolioObject.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.PortfolioArray.t} | {:error, Tesla.Env.t}
  def create_portfolio(connection, portfolio_object, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:post)
    |> url("/portfolios")
    |> add_param(:body, :body, portfolio_object)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 201, %Asana.Model.PortfolioArray{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Delete a portfolio
  An existing portfolio can be deleted by making a DELETE request on the URL for that portfolio.  Returns an empty data record.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - portfolio_gid (String.t): Globally unique identifier for the portfolio.
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
  @spec delete_portfolio(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.EmptyObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def delete_portfolio(connection, portfolio_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:delete)
    |> url("/portfolios/#{portfolio_gid}")
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
  Get a portfolio
  Returns the complete portfolio record for a single portfolio.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - portfolio_gid (String.t): Globally unique identifier for the portfolio.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.PortfolioObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_portfolio(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.PortfolioObject.t} | {:error, Tesla.Env.t}
  def get_portfolio(connection, portfolio_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/portfolios/#{portfolio_gid}")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.PortfolioObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end

  @doc """
  Get portfolio items
  Get a list of the items (projects) in compact form in a portfolio.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - portfolio_gid (String.t): Globally unique identifier for the portfolio.
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
  @spec get_portfolio_items(Tesla.Env.client, String.t, keyword()) :: {:ok, Asana.Model.TaskArray.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def get_portfolio_items(connection, portfolio_gid, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/portfolios/#{portfolio_gid}/items")
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
  Get a list of the portfolios
  Returns a list of the portfolios in compact representation that are owned by the current API user.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
    - :workspace (String.t): The workspace or organization to filter portfolios on.
    - :owner (String.t): The user who owns the portfolio. Currently, API users can only get a list of portfolios that they themselves own.
  ## Returns

  {:ok, Asana.Model.PortfolioArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_portfolios(Tesla.Env.client, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.PortfolioArray.t} | {:error, Tesla.Env.t}
  def get_portfolios(connection, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query,
      :"workspace" => :query,
      :"owner" => :query
    }
    %{}
    |> method(:get)
    |> url("/portfolios")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.PortfolioArray{}},
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
  Remove a portfolio item
  Remove an item (project) from a portfolio. Returns an empty data block.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - portfolio_gid (String.t): Globally unique identifier for the portfolio.
  - item (String.t): The item (project) to remove from the portfolio.
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
  @spec remove_portfolio_item(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, Asana.Model.EmptyObject.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def remove_portfolio_item(connection, portfolio_gid, item, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:post)
    |> url("/portfolios/#{portfolio_gid}/removeItem")
    |> add_param(:query, :"item", item)
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
  Update a portfolio
  An existing portfolio can be updated by making a PUT request on the URL for that portfolio. Only the fields provided in the `data` block will be updated; any unspecified fields will remain unchanged.  Returns the complete updated portfolio record.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - portfolio_gid (String.t): Globally unique identifier for the portfolio.
  - portfolio_object (PortfolioObject): The updated fields for the portfolio.
  - opts (KeywordList): [optional] Optional parameters
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.PortfolioObject.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec updateportfolio(Tesla.Env.client, String.t, Asana.Model.PortfolioObject.t, keyword()) :: {:ok, Asana.Model.Error.t} | {:ok, Asana.Model.PortfolioObject.t} | {:error, Tesla.Env.t}
  def updateportfolio(connection, portfolio_gid, portfolio_object, opts \\ []) do
    optional_params = %{
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:put)
    |> url("/portfolios/#{portfolio_gid}")
    |> add_param(:body, :body, portfolio_object)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.PortfolioObject{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end
end
