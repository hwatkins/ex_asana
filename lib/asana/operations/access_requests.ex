defmodule Asana.AccessRequests do
  @moduledoc """
  Provides API endpoints related to access requests
  """

  @default_client Asana.Client

  @type approve_access_request_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Approve an access request

  Approves an access request for a target object.
  """
  @spec approve_access_request(access_request_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.AccessRequests.approve_access_request_200_json_resp()}
          | {:error, Asana.Error.t()}
  def approve_access_request(access_request_gid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [access_request_gid: access_request_gid],
      call: {Asana.AccessRequests, :approve_access_request},
      url: "/access_requests/#{access_request_gid}/approve",
      method: :post,
      response: [
        {200, {Asana.AccessRequests, :approve_access_request_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type create_access_request_201_json_resp :: %{
          __info__: map,
          data: Asana.AccessRequest.response() | nil
        }

  @doc """
  Create an access request

  Submits a new access request for a private object. Currently supports projects and portfolios.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_access_request(body :: map, opts :: keyword) ::
          {:ok, Asana.AccessRequests.create_access_request_201_json_resp()}
          | {:error, Asana.Error.t()}
  def create_access_request(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Asana.AccessRequests, :create_access_request},
      url: "/access_requests",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.AccessRequests, :create_access_request_201_json_resp}},
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

  @type get_access_requests_200_json_resp :: %{
          __info__: map,
          data: [Asana.AccessRequest.response()] | nil
        }

  @doc """
  Get access requests

  Returns the pending access requests for a target object or a target object filtered by user.

  ## Options

    * `target`: Globally unique identifier for the target object.
    * `user`: A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_access_requests(opts :: keyword) ::
          {:ok, Asana.AccessRequests.get_access_requests_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_access_requests(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty, :target, :user])

    client.request(%{
      args: [],
      call: {Asana.AccessRequests, :get_access_requests},
      url: "/access_requests",
      method: :get,
      query: query,
      response: [
        {200, {Asana.AccessRequests, :get_access_requests_200_json_resp}},
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

  @type reject_access_request_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Reject an access request

  Rejects an access request for a target object.
  """
  @spec reject_access_request(access_request_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.AccessRequests.reject_access_request_200_json_resp()}
          | {:error, Asana.Error.t()}
  def reject_access_request(access_request_gid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [access_request_gid: access_request_gid],
      call: {Asana.AccessRequests, :reject_access_request},
      url: "/access_requests/#{access_request_gid}/reject",
      method: :post,
      response: [
        {200, {Asana.AccessRequests, :reject_access_request_200_json_resp}},
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
  def __fields__(:approve_access_request_200_json_resp) do
    [data: :map]
  end

  def __fields__(:create_access_request_201_json_resp) do
    [data: {Asana.AccessRequest, :response}]
  end

  def __fields__(:get_access_requests_200_json_resp) do
    [data: [{Asana.AccessRequest, :response}]]
  end

  def __fields__(:reject_access_request_200_json_resp) do
    [data: :map]
  end
end
