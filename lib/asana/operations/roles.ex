defmodule Asana.Roles do
  @moduledoc """
  Provides API endpoints related to roles
  """

  @default_client Asana.Client

  @type create_role_201_json_resp :: %{__info__: map, data: Asana.RbacRole.response() | nil}

  @doc """
  Create a role

  <b>Required scope: </b><code>roles:write</code>

  Creates a new RBAC role in the workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The role to create.
  """
  @spec create_role(body :: map, opts :: keyword) ::
          {:ok, Asana.Roles.create_role_201_json_resp()} | {:error, Asana.Error.t()}
  def create_role(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Roles, :create_role},
      url: "/roles",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Roles, :create_role_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type delete_role_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a role

  <b>Required scope: </b><code>roles:delete</code>

  Deletes a role from a workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_role(role_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Roles.delete_role_200_json_resp()} | {:error, Asana.Error.t()}
  def delete_role(role_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [role_gid: role_gid],
      call: {Asana.Roles, :delete_role},
      url: "/roles/#{role_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Roles, :delete_role_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_role_200_json_resp :: %{__info__: map, data: Asana.RbacRole.response() | nil}

  @doc """
  Get a role

  <b>Required scope: </b><code>roles:read</code>

  Returns the complete role record for a single role.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_role(role_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Roles.get_role_200_json_resp()} | {:error, Asana.Error.t()}
  def get_role(role_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [role_gid: role_gid],
      call: {Asana.Roles, :get_role},
      url: "/roles/#{role_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Roles, :get_role_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_roles_200_json_resp :: %{
          __info__: map,
          data: [Asana.RbacRole.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get multiple roles

  <b>Required scope: </b><code>roles:read</code>

  Returns all RBAC roles for a workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `workspace`: The workspace or organization to filter roles on.
    * `archived`: Only return projects whose `archived` field takes on the value of this parameter.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_roles(opts :: keyword) ::
          {:ok, Asana.Roles.get_roles_200_json_resp()} | {:error, Asana.Error.t()}
  def get_roles(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:archived, :limit, :offset, :opt_fields, :opt_pretty, :workspace])

    client.request(%{
      args: [],
      call: {Asana.Roles, :get_roles},
      url: "/roles",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Roles, :get_roles_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_role_200_json_resp :: %{__info__: map, data: Asana.RbacRole.response() | nil}

  @doc """
  Update a role

  <b>Required scope: </b><code>roles:write</code>

  Updates a role in a workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the role.
  """
  @spec update_role(role_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Roles.update_role_200_json_resp()} | {:error, Asana.Error.t()}
  def update_role(role_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [role_gid: role_gid, body: body],
      call: {Asana.Roles, :update_role},
      url: "/roles/#{role_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Roles, :update_role_200_json_resp}},
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
  def __fields__(:create_role_201_json_resp) do
    [data: {Asana.RbacRole, :response}]
  end

  def __fields__(:delete_role_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_role_200_json_resp) do
    [data: {Asana.RbacRole, :response}]
  end

  def __fields__(:get_roles_200_json_resp) do
    [data: [{Asana.RbacRole, :compact}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:update_role_200_json_resp) do
    [data: {Asana.RbacRole, :response}]
  end
end
