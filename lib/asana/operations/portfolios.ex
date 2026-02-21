defmodule Asana.Portfolios do
  @moduledoc """
  Provides API endpoints related to portfolios
  """

  @default_client Asana.Client

  @type add_custom_field_setting_for_portfolio_200_json_resp :: %{
          __info__: map,
          data: Asana.CustomField.Setting.response() | nil
        }

  @doc """
  Add a custom field to a portfolio

  <b>Required scope: </b><code>portfolios:write</code>

  Custom fields are associated with portfolios by way of custom field settings.  This method creates a setting for the portfolio.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  Information about the custom field setting.
  """
  @spec add_custom_field_setting_for_portfolio(
          portfolio_gid :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Asana.Portfolios.add_custom_field_setting_for_portfolio_200_json_resp()}
          | {:error, Asana.Error.t()}
  def add_custom_field_setting_for_portfolio(portfolio_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid, body: body],
      call: {Asana.Portfolios, :add_custom_field_setting_for_portfolio},
      url: "/portfolios/#{portfolio_gid}/addCustomFieldSetting",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Portfolios, :add_custom_field_setting_for_portfolio_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type add_item_for_portfolio_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Add a portfolio item

  <b>Required scope: </b><code>portfolios:write</code>

  Add an item to a portfolio.
  Returns an empty data block.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  Information about the item being inserted.
  """
  @spec add_item_for_portfolio(portfolio_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Portfolios.add_item_for_portfolio_200_json_resp()}
          | {:error, Asana.Error.t()}
  def add_item_for_portfolio(portfolio_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid, body: body],
      call: {Asana.Portfolios, :add_item_for_portfolio},
      url: "/portfolios/#{portfolio_gid}/addItem",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Portfolios, :add_item_for_portfolio_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type add_members_for_portfolio_200_json_resp :: %{
          __info__: map,
          data: Asana.Portfolio.response() | nil
        }

  @doc """
  Add users to a portfolio

  Adds the specified list of users as members of the portfolio.
  Returns the updated portfolio record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Information about the members being added.
  """
  @spec add_members_for_portfolio(portfolio_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Portfolios.add_members_for_portfolio_200_json_resp()}
          | {:error, Asana.Error.t()}
  def add_members_for_portfolio(portfolio_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid, body: body],
      call: {Asana.Portfolios, :add_members_for_portfolio},
      url: "/portfolios/#{portfolio_gid}/addMembers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Portfolios, :add_members_for_portfolio_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type create_portfolio_201_json_resp :: %{__info__: map, data: Asana.Portfolio.response() | nil}

  @doc """
  Create a portfolio

  <b>Required scope: </b><code>portfolios:write</code>

  Creates a new portfolio in the given workspace with the supplied name.

  Note that portfolios created in the Asana UI may have some state
  (like the “Priority” custom field) which is automatically added
  to the portfolio when it is created. Portfolios created via our
  API will *not* be created with the same initial state to allow
  integrations to create their own starting state on a portfolio.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The portfolio to create.
  """
  @spec create_portfolio(body :: map, opts :: keyword) ::
          {:ok, Asana.Portfolios.create_portfolio_201_json_resp()} | {:error, Asana.Error.t()}
  def create_portfolio(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Portfolios, :create_portfolio},
      url: "/portfolios",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Portfolios, :create_portfolio_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type delete_portfolio_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a portfolio

  An existing portfolio can be deleted by making a DELETE request on
  the URL for that portfolio.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_portfolio(portfolio_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Portfolios.delete_portfolio_200_json_resp()} | {:error, Asana.Error.t()}
  def delete_portfolio(portfolio_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid],
      call: {Asana.Portfolios, :delete_portfolio},
      url: "/portfolios/#{portfolio_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Portfolios, :delete_portfolio_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_items_for_portfolio_200_json_resp :: %{
          __info__: map,
          data: [Asana.Project.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get portfolio items

  <b>Required scope: </b><code>portfolios:read</code>

  Get a list of the items in compact form in a portfolio.

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
  @spec get_items_for_portfolio(portfolio_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Portfolios.get_items_for_portfolio_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_items_for_portfolio(portfolio_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid],
      call: {Asana.Portfolios, :get_items_for_portfolio},
      url: "/portfolios/#{portfolio_gid}/items",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Portfolios, :get_items_for_portfolio_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_portfolio_200_json_resp :: %{__info__: map, data: Asana.Portfolio.response() | nil}

  @doc """
  Get a portfolio

  <b>Required scope: </b><code>portfolios:read</code>

  Returns the complete portfolio record for a single portfolio.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_portfolio(portfolio_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Portfolios.get_portfolio_200_json_resp()} | {:error, Asana.Error.t()}
  def get_portfolio(portfolio_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid],
      call: {Asana.Portfolios, :get_portfolio},
      url: "/portfolios/#{portfolio_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Portfolios, :get_portfolio_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_portfolios_200_json_resp :: %{
          __info__: map,
          data: [Asana.Portfolio.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get multiple portfolios

  <b>Required scope: </b><code>portfolios:read</code>

  Returns a list of the portfolios in compact representation that are owned by the current API user.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `workspace`: The workspace or organization to filter portfolios on.
    * `owner`: The user who owns the portfolio. Currently, API users can only get a list of portfolios that they themselves own, unless the request is made from a Service Account. In the case of a Service Account, if this parameter is specified, then all portfolios owned by this parameter are returned. Otherwise, all portfolios across the workspace are returned.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_portfolios(opts :: keyword) ::
          {:ok, Asana.Portfolios.get_portfolios_200_json_resp()} | {:error, Asana.Error.t()}
  def get_portfolios(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :owner, :workspace])

    client.request(%{
      args: [],
      call: {Asana.Portfolios, :get_portfolios},
      url: "/portfolios",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Portfolios, :get_portfolios_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type remove_custom_field_setting_for_portfolio_200_json_resp :: %{
          __info__: map,
          data: map | nil
        }

  @doc """
  Remove a custom field from a portfolio

  <b>Required scope: </b><code>portfolios:write</code>

  Removes a custom field setting from a portfolio.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  Information about the custom field setting being removed.
  """
  @spec remove_custom_field_setting_for_portfolio(
          portfolio_gid :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Asana.Portfolios.remove_custom_field_setting_for_portfolio_200_json_resp()}
          | {:error, Asana.Error.t()}
  def remove_custom_field_setting_for_portfolio(portfolio_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid, body: body],
      call: {Asana.Portfolios, :remove_custom_field_setting_for_portfolio},
      url: "/portfolios/#{portfolio_gid}/removeCustomFieldSetting",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Portfolios, :remove_custom_field_setting_for_portfolio_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type remove_item_for_portfolio_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Remove a portfolio item

  <b>Required scope: </b><code>portfolios:write</code>

  Remove an item from a portfolio.
  Returns an empty data block.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  Information about the item being removed.
  """
  @spec remove_item_for_portfolio(portfolio_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Portfolios.remove_item_for_portfolio_200_json_resp()}
          | {:error, Asana.Error.t()}
  def remove_item_for_portfolio(portfolio_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid, body: body],
      call: {Asana.Portfolios, :remove_item_for_portfolio},
      url: "/portfolios/#{portfolio_gid}/removeItem",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Portfolios, :remove_item_for_portfolio_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type remove_members_for_portfolio_200_json_resp :: %{
          __info__: map,
          data: Asana.Portfolio.response() | nil
        }

  @doc """
  Remove users from a portfolio

  Removes the specified list of users from members of the portfolio.
  Returns the updated portfolio record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  Information about the members being removed.
  """
  @spec remove_members_for_portfolio(portfolio_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Portfolios.remove_members_for_portfolio_200_json_resp()}
          | {:error, Asana.Error.t()}
  def remove_members_for_portfolio(portfolio_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid, body: body],
      call: {Asana.Portfolios, :remove_members_for_portfolio},
      url: "/portfolios/#{portfolio_gid}/removeMembers",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Portfolios, :remove_members_for_portfolio_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_portfolio_200_json_resp :: %{__info__: map, data: Asana.Portfolio.response() | nil}

  @doc """
  Update a portfolio

  <b>Required scope: </b><code>portfolios:write</code>

  An existing portfolio can be updated by making a PUT request on the URL for
  that portfolio. Only the fields provided in the `data` block will be updated;
  any unspecified fields will remain unchanged.

  Returns the complete updated portfolio record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the portfolio.
  """
  @spec update_portfolio(portfolio_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Portfolios.update_portfolio_200_json_resp()} | {:error, Asana.Error.t()}
  def update_portfolio(portfolio_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid, body: body],
      call: {Asana.Portfolios, :update_portfolio},
      url: "/portfolios/#{portfolio_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Portfolios, :update_portfolio_200_json_resp}},
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
  def __fields__(:add_custom_field_setting_for_portfolio_200_json_resp) do
    [data: {Asana.CustomField.Setting, :response}]
  end

  def __fields__(:add_item_for_portfolio_200_json_resp) do
    [data: :map]
  end

  def __fields__(:add_members_for_portfolio_200_json_resp) do
    [data: {Asana.Portfolio, :response}]
  end

  def __fields__(:create_portfolio_201_json_resp) do
    [data: {Asana.Portfolio, :response}]
  end

  def __fields__(:delete_portfolio_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_items_for_portfolio_200_json_resp) do
    [data: [{Asana.Project, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:get_portfolio_200_json_resp) do
    [data: {Asana.Portfolio, :response}]
  end

  def __fields__(:get_portfolios_200_json_resp) do
    [data: [{Asana.Portfolio, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:remove_custom_field_setting_for_portfolio_200_json_resp) do
    [data: :map]
  end

  def __fields__(:remove_item_for_portfolio_200_json_resp) do
    [data: :map]
  end

  def __fields__(:remove_members_for_portfolio_200_json_resp) do
    [data: {Asana.Portfolio, :response}]
  end

  def __fields__(:update_portfolio_200_json_resp) do
    [data: {Asana.Portfolio, :response}]
  end
end
