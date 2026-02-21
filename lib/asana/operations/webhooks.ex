defmodule Asana.Webhooks do
  @moduledoc """
  Provides API endpoints related to webhooks
  """

  @default_client Asana.Client

  @type create_webhook_201_json_resp :: %{
          "X-Hook-Secret": String.t() | nil,
          __info__: map,
          data: Asana.Webhook.response() | nil
        }

  @doc """
  Establish a webhook

  <b>Required scope: </b><code>webhooks:write</code>

  Establishing a webhook is a two-part process. First, a simple HTTP POST
  request initiates the creation similar to creating any other resource.

  Next, in the middle of this request comes the confirmation handshake.
  When a webhook is created, we will send a test POST to the target with an
  `X-Hook-Secret` header. The target must respond with a `200 OK` or `204
  No Content` and a matching `X-Hook-Secret` header to confirm that this
  webhook subscription is indeed expected. We strongly recommend storing
  this secret to be used to verify future webhook event signatures.

  The POST request to create the webhook will then return with the status
  of the request. If you do not acknowledge the webhook’s confirmation
  handshake it will fail to setup, and you will receive an error in
  response to your attempt to create it. This means you need to be able to
  receive and complete the webhook *while* the POST request is in-flight
  (in other words, have a server that can handle requests asynchronously).

  Invalid hostnames like localhost will receive a 403 Forbidden status code.

  ```
  # Request
  curl -H "Authorization: Bearer <personal_access_token>" \
  -X POST https://app.asana.com/api/1.0/webhooks \
  -d "resource=8675309" \
  -d "target=https://example.com/receive-webhook/7654"
  ```

  ```
  # Handshake sent to https://example.com/
  POST /receive-webhook/7654
  X-Hook-Secret: b537207f20cbfa02357cf448134da559e8bd39d61597dcd5631b8012eae53e81
  ```

  ```
  # Handshake response sent by example.com
  HTTP/1.1 200
  X-Hook-Secret: b537207f20cbfa02357cf448134da559e8bd39d61597dcd5631b8012eae53e81
  ```

  ```
  # Response
  HTTP/1.1 201
  {
    "data": {
      "gid": "43214",
      "resource": {
        "gid": "8675309",
        "name": "Bugs"
      },
      "target": "https://example.com/receive-webhook/7654",
      "active": false,
      "last_success_at": null,
      "last_failure_at": null,
      "last_failure_content": null
    },
    "X-Hook-Secret": "b537207f20cbfa02357cf448134da559e8bd39d61597dcd5631b8012eae53e81"
  }
  ```

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The webhook workspace and target.
  """
  @spec create_webhook(body :: map, opts :: keyword) ::
          {:ok, Asana.Webhooks.create_webhook_201_json_resp()} | {:error, Asana.Error.t()}
  def create_webhook(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Webhooks, :create_webhook},
      url: "/webhooks",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Webhooks, :create_webhook_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type delete_webhook_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a webhook

  <b>Required scope: </b><code>webhooks:delete</code>

  This method *permanently* removes a webhook. Note that it may be possible to receive a request that was already in flight after deleting the webhook, but no further requests will be issued.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_webhook(webhook_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Webhooks.delete_webhook_200_json_resp()} | {:error, Asana.Error.t()}
  def delete_webhook(webhook_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [webhook_gid: webhook_gid],
      call: {Asana.Webhooks, :delete_webhook},
      url: "/webhooks/#{webhook_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Webhooks, :delete_webhook_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_webhook_200_json_resp :: %{__info__: map, data: Asana.Webhook.response() | nil}

  @doc """
  Get a webhook

  <b>Required scope: </b><code>webhooks:read</code>

  Returns the full record for the given webhook.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_webhook(webhook_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Webhooks.get_webhook_200_json_resp()} | {:error, Asana.Error.t()}
  def get_webhook(webhook_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [webhook_gid: webhook_gid],
      call: {Asana.Webhooks, :get_webhook},
      url: "/webhooks/#{webhook_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Webhooks, :get_webhook_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_webhooks_200_json_resp :: %{
          __info__: map,
          data: [Asana.Webhook.response()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get multiple webhooks

  <b>Required scope: </b><code>webhooks:read</code>

  Get the compact representation of all webhooks your app has registered for the authenticated user in the given workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `workspace`: The workspace to query for webhooks in.
    * `resource`: Only return webhooks for the given resource.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_webhooks(opts :: keyword) ::
          {:ok, Asana.Webhooks.get_webhooks_200_json_resp()} | {:error, Asana.Error.t()}
  def get_webhooks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :resource, :workspace])

    client.request(%{
      args: [],
      call: {Asana.Webhooks, :get_webhooks},
      url: "/webhooks",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Webhooks, :get_webhooks_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_webhook_200_json_resp :: %{__info__: map, data: Asana.Webhook.response() | nil}

  @doc """
  Update a webhook

  <b>Required scope: </b><code>webhooks:write</code>

  An existing webhook's filters can be updated by making a PUT request on the URL for that webhook. Note that the webhook's previous `filters` array will be completely overwritten by the `filters` sent in the PUT request.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated filters for the webhook.
  """
  @spec update_webhook(webhook_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Webhooks.update_webhook_200_json_resp()} | {:error, Asana.Error.t()}
  def update_webhook(webhook_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [webhook_gid: webhook_gid, body: body],
      call: {Asana.Webhooks, :update_webhook},
      url: "/webhooks/#{webhook_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Webhooks, :update_webhook_200_json_resp}},
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
  def __fields__(:create_webhook_201_json_resp) do
    ["X-Hook-Secret": :string, data: {Asana.Webhook, :response}]
  end

  def __fields__(:delete_webhook_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_webhook_200_json_resp) do
    [data: {Asana.Webhook, :response}]
  end

  def __fields__(:get_webhooks_200_json_resp) do
    [data: [{Asana.Webhook, :response}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:update_webhook_200_json_resp) do
    [data: {Asana.Webhook, :response}]
  end
end
