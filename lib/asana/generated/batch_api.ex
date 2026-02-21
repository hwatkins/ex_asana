defmodule Asana.Generated.BatchAPI do
  @moduledoc """
  Provides API endpoint related to batch api
  """

  @default_client Asana.OperationClient

  @type create_batch_request_200_json_resp :: %{data: [Asana.Generated.BatchResponse.t()] | nil}

  @doc """
  Submit parallel requests

  Make multiple requests in parallel to Asana's API.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The requests to batch together via the Batch API.
  """
  @spec create_batch_request(body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.BatchAPI.create_batch_request_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_batch_request(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Generated.BatchAPI, :create_batch_request},
      url: "/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.BatchAPI, :create_batch_request_200_json_resp}},
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
  def __fields__(:create_batch_request_200_json_resp) do
    [data: [{Asana.Generated.BatchResponse, :t}]]
  end
end
