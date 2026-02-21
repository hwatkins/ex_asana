defmodule Asana.Generated.Rates do
  @moduledoc """
  Provides API endpoints related to rates
  """

  @default_client Asana.OperationClient

  @type create_rate_201_json_resp :: %{data: Asana.Generated.RateResponse.t() | nil}

  @doc """
  Create a rate

  Creates a new rate for a `parent` + `resource` combination.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The rate to create.
  """
  @spec create_rate(body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Rates.create_rate_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_rate(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Generated.Rates, :create_rate},
      url: "/rates",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Rates, :create_rate_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {402, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type delete_rate_200_json_resp :: %{data: map | nil}

  @doc """
  Delete a rate

  Deletes a rate.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_rate(rate_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Rates.delete_rate_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def delete_rate(rate_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [rate_gid: rate_gid],
      call: {Asana.Generated.Rates, :delete_rate},
      url: "/rates/#{rate_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Generated.Rates, :delete_rate_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {402, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_rate_200_json_resp :: %{data: Asana.Generated.RateResponse.t() | nil}

  @doc """
  Get a rate

  Returns the complete rate record for a single rate.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_rate(rate_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Rates.get_rate_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_rate(rate_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [rate_gid: rate_gid],
      call: {Asana.Generated.Rates, :get_rate},
      url: "/rates/#{rate_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Rates, :get_rate_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {402, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_rates_200_json_resp :: %{
          data:
            [Asana.Generated.PlaceholderRateCompact.t() | Asana.Generated.RateCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get multiple rates

  Returns a list of `rate` records. The possible types for `parent` in this request are `project`. An additional `resource` (`user` GID or `placeholder` GID) can be passed in to filter to a specific rate.

  Modifying placeholder rates is only available for Enterprise and Enterprise+ users.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `parent`: Globally unique identifier for `project`.
    * `resource`: Globally unique identifier for `user` or `placeholder`.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_rates(opts :: keyword) ::
          {:ok, Asana.Generated.Rates.get_rates_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_rates(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :parent, :resource])

    client.request(%{
      args: [],
      call: {Asana.Generated.Rates, :get_rates},
      url: "/rates",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Rates, :get_rates_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {402, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type update_rate_200_json_resp :: %{data: Asana.Generated.RateResponse.t() | nil}

  @doc """
  Update a rate

  An existing rate can be updated by making a PUT request on the URL for
  that rate. Only the fields provided in the `data` block will be updated;
  any unspecified fields will remain unchanged. (note that at this time, the only field that can be updated is the `rate` field.)

  Returns the complete updated rate record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the rate.
  """
  @spec update_rate(rate_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Rates.update_rate_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def update_rate(rate_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [rate_gid: rate_gid, body: body],
      call: {Asana.Generated.Rates, :update_rate},
      url: "/rates/#{rate_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Rates, :update_rate_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {402, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_rate_201_json_resp) do
    [data: {Asana.Generated.RateResponse, :t}]
  end

  def __fields__(:delete_rate_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_rate_200_json_resp) do
    [data: {Asana.Generated.RateResponse, :t}]
  end

  def __fields__(:get_rates_200_json_resp) do
    [
      data: [
        union: [{Asana.Generated.PlaceholderRateCompact, :t}, {Asana.Generated.RateCompact, :t}]
      ],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end

  def __fields__(:update_rate_200_json_resp) do
    [data: {Asana.Generated.RateResponse, :t}]
  end
end
