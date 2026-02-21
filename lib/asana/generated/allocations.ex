defmodule Asana.Generated.Allocations do
  @moduledoc """
  Provides API endpoints related to allocations
  """

  @default_client Asana.OperationClient

  @type create_allocation_201_json_resp :: %{data: Asana.Generated.AllocationResponse.t() | nil}

  @doc """
  Create an allocation

  Creates a new allocation.

  Returns the full record of the newly created allocation.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The allocation to create.
  """
  @spec create_allocation(body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Allocations.create_allocation_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_allocation(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Generated.Allocations, :create_allocation},
      url: "/allocations",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Allocations, :create_allocation_201_json_resp}},
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

  @type delete_allocation_200_json_resp :: %{data: map | nil}

  @doc """
  Delete an allocation

  A specific, existing allocation can be deleted by making a DELETE request on the URL for that allocation.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_allocation(allocation_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Allocations.delete_allocation_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def delete_allocation(allocation_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [allocation_gid: allocation_gid],
      call: {Asana.Generated.Allocations, :delete_allocation},
      url: "/allocations/#{allocation_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Generated.Allocations, :delete_allocation_200_json_resp}},
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

  @type get_allocation_200_json_resp :: %{data: Asana.Generated.AllocationResponse.t() | nil}

  @doc """
  Get an allocation

  Returns the complete allocation record for a single allocation.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_allocation(allocation_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Allocations.get_allocation_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_allocation(allocation_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [allocation_gid: allocation_gid],
      call: {Asana.Generated.Allocations, :get_allocation},
      url: "/allocations/#{allocation_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Allocations, :get_allocation_200_json_resp}},
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

  @type get_allocations_200_json_resp :: %{
          data: [Asana.Generated.AllocationResponse.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get multiple allocations

  Returns a list of allocations filtered to a specific project, user or placeholder.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `parent`: Globally unique identifier for the project to filter allocations by.
    * `assignee`: Globally unique identifier for the user or placeholder the allocation is assigned to.
    * `workspace`: Globally unique identifier for the workspace.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_allocations(opts :: keyword) ::
          {:ok, Asana.Generated.Allocations.get_allocations_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_allocations(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :assignee,
        :limit,
        :offset,
        :opt_fields,
        :opt_pretty,
        :parent,
        :workspace
      ])

    client.request(%{
      args: [],
      call: {Asana.Generated.Allocations, :get_allocations},
      url: "/allocations",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Allocations, :get_allocations_200_json_resp}},
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

  @type update_allocation_200_json_resp :: %{data: Asana.Generated.AllocationResponse.t() | nil}

  @doc """
  Update an allocation

  An existing allocation can be updated by making a PUT request on the URL for
  that allocation. Only the fields provided in the `data` block will be updated;
  any unspecified fields will remain unchanged.

  Returns the complete updated allocation record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the allocation.
  """
  @spec update_allocation(allocation_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Allocations.update_allocation_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def update_allocation(allocation_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [allocation_gid: allocation_gid, body: body],
      call: {Asana.Generated.Allocations, :update_allocation},
      url: "/allocations/#{allocation_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Allocations, :update_allocation_200_json_resp}},
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
  def __fields__(:create_allocation_201_json_resp) do
    [data: {Asana.Generated.AllocationResponse, :t}]
  end

  def __fields__(:delete_allocation_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_allocation_200_json_resp) do
    [data: {Asana.Generated.AllocationResponse, :t}]
  end

  def __fields__(:get_allocations_200_json_resp) do
    [data: [{Asana.Generated.AllocationResponse, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end

  def __fields__(:update_allocation_200_json_resp) do
    [data: {Asana.Generated.AllocationResponse, :t}]
  end
end
