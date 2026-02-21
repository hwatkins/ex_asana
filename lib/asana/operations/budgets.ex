defmodule Asana.Budgets do
  @moduledoc """
  Provides API endpoints related to budgets
  """

  @default_client Asana.Client

  @type create_budget_201_json_resp :: %{__info__: map, data: Asana.Budget.response() | nil}

  @doc """
  Create a budget

  Creates a new budget.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The budget to create.
  """
  @spec create_budget(body :: map, opts :: keyword) ::
          {:ok, Asana.Budgets.create_budget_201_json_resp()} | {:error, Asana.Error.t()}
  def create_budget(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Budgets, :create_budget},
      url: "/budgets",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Budgets, :create_budget_201_json_resp}},
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

  @type delete_budget_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a budget

  A specific, existing budget can be deleted by making a DELETE request on the URL for that budget.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_budget(budget_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Budgets.delete_budget_200_json_resp()} | {:error, Asana.Error.t()}
  def delete_budget(budget_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [budget_gid: budget_gid],
      call: {Asana.Budgets, :delete_budget},
      url: "/budgets/#{budget_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Budgets, :delete_budget_200_json_resp}},
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

  @type get_budget_200_json_resp :: %{__info__: map, data: Asana.Budget.response() | nil}

  @doc """
  Get a budget

  Returns the complete budget record for a single budget.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_budget(budget_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Budgets.get_budget_200_json_resp()} | {:error, Asana.Error.t()}
  def get_budget(budget_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [budget_gid: budget_gid],
      call: {Asana.Budgets, :get_budget},
      url: "/budgets/#{budget_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Budgets, :get_budget_200_json_resp}},
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

  @type get_budgets_200_json_resp :: %{__info__: map, data: [Asana.Budget.response()] | nil}

  @doc """
  Get all budgets

  Gets all budgets for a given *parent*. This will at most return a list of size 1 for a given *parent*.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `parent`: Globally unique identifier for the budget's parent object. This currently can only be a `project`.

  """
  @spec get_budgets(opts :: keyword) ::
          {:ok, Asana.Budgets.get_budgets_200_json_resp()} | {:error, Asana.Error.t()}
  def get_budgets(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty, :parent])

    client.request(%{
      args: [],
      call: {Asana.Budgets, :get_budgets},
      url: "/budgets",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Budgets, :get_budgets_200_json_resp}},
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

  @type update_budget_200_json_resp :: %{__info__: map, data: Asana.Budget.response() | nil}

  @doc """
  Update a budget

  An existing budget can be updated by making a PUT request on the URL for
  that budget. Only the fields provided in the `data` block will be updated;
  any unspecified fields will remain unchanged.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The budget to update.
  """
  @spec update_budget(budget_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Budgets.update_budget_200_json_resp()} | {:error, Asana.Error.t()}
  def update_budget(budget_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [budget_gid: budget_gid, body: body],
      call: {Asana.Budgets, :update_budget},
      url: "/budgets/#{budget_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Budgets, :update_budget_200_json_resp}},
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
  def __fields__(:create_budget_201_json_resp) do
    [data: {Asana.Budget, :response}]
  end

  def __fields__(:delete_budget_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_budget_200_json_resp) do
    [data: {Asana.Budget, :response}]
  end

  def __fields__(:get_budgets_200_json_resp) do
    [data: [{Asana.Budget, :response}]]
  end

  def __fields__(:update_budget_200_json_resp) do
    [data: {Asana.Budget, :response}]
  end
end
