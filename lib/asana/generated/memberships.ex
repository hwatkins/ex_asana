defmodule Asana.Generated.Memberships do
  @moduledoc """
  Provides API endpoints related to memberships
  """

  @default_client Asana.OperationClient

  @type create_membership_201_json_resp :: %{
          data:
            Asana.Generated.CustomFieldMembershipResponse.t()
            | Asana.Generated.CustomTypeMembershipResponse.t()
            | Asana.Generated.GoalMembershipResponse.t()
            | Asana.Generated.PortfolioMembershipResponse.t()
            | Asana.Generated.ProjectMembershipCompactResponse.t()
            | nil
        }

  @doc """
  Create a membership

  Creates a new membership in a `goal`, `project`, `portfolio`, `custom_type`, or `custom_field`, where members can be Teams or Users.

  Returns the full record of the newly created membership.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the membership.
  """
  @spec create_membership(body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Memberships.create_membership_201_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_membership(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Generated.Memberships, :create_membership},
      url: "/memberships",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.Generated.Memberships, :create_membership_201_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type delete_membership_200_json_resp :: %{data: map | nil}

  @doc """
  Delete a membership

  A specific, existing membership for a `goal`, `project`, `portfolio`, `custom_type`, or `custom_field` can be deleted by making a `DELETE` request
  on the URL for that membership.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_membership(membership_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Memberships.delete_membership_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def delete_membership(membership_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [membership_gid: membership_gid],
      call: {Asana.Generated.Memberships, :delete_membership},
      url: "/memberships/#{membership_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Generated.Memberships, :delete_membership_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_membership_200_json_resp :: %{
          data:
            Asana.Generated.CustomFieldMembershipResponse.t()
            | Asana.Generated.CustomTypeMembershipResponse.t()
            | Asana.Generated.GoalMembershipResponse.t()
            | Asana.Generated.PortfolioMembershipResponse.t()
            | Asana.Generated.ProjectMembershipCompactResponse.t()
            | nil
        }

  @doc """
  Get a membership

  Returns a `project_membership`, `goal_membership`, `portfolio_membership`, `custom_type_membership`, or `custom_field_membership` record for a membership id.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec get_membership(membership_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Memberships.get_membership_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_membership(membership_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [membership_gid: membership_gid],
      call: {Asana.Generated.Memberships, :get_membership},
      url: "/memberships/#{membership_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Memberships, :get_membership_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_memberships_200_json_resp :: %{
          data:
            [
              Asana.Generated.CustomFieldMembershipCompact.t()
              | Asana.Generated.CustomTypeMembershipCompact.t()
              | Asana.Generated.GoalMembershipCompact.t()
              | Asana.Generated.PortfolioMembershipCompactResponse.t()
              | Asana.Generated.ProjectMembershipCompactResponse.t()
            ]
            | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get multiple memberships

  Returns compact `goal_membership`, `project_membership`, `portfolio_membership`, `custom_type_membership`, or `custom_field_membership` records. The possible types for `parent` in this request are `goal`, `project`, `portfolio`, `custom_type`, or `custom_field`. An additional member (user GID or team GID) can be passed in to filter to a specific membership.

  Alternatively, when `parent` is absent, you can use the `member` and `resource_subtype` parameters together to fetch all memberships of a specific type for a given member. For example, passing `member` as a team GID and `resource_subtype` as `project_membership` will return all project memberships for that team.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `parent`: Globally unique identifier for `goal`, `project`, `portfolio`, `custom_type`, or `custom_field`. This parameter is optional when `resource_subtype` is provided along with `member`.
    * `member`: Globally unique identifier for `team` or `user`. When used with `resource_subtype` and without `parent`, returns all memberships of the specified subtype for this member.
    * `resource_subtype`: The type of membership to return. Required when `parent` is absent. Currently supported value is `project_membership` (when `member` is a team GID, returns all project memberships for that team).
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_memberships(opts :: keyword) ::
          {:ok, Asana.Generated.Memberships.get_memberships_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_memberships(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :limit,
        :member,
        :offset,
        :opt_fields,
        :opt_pretty,
        :parent,
        :resource_subtype
      ])

    client.request(%{
      args: [],
      call: {Asana.Generated.Memberships, :get_memberships},
      url: "/memberships",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Memberships, :get_memberships_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type update_membership_200_json_resp :: %{
          data:
            Asana.Generated.CustomFieldMembershipResponse.t()
            | Asana.Generated.CustomTypeMembershipResponse.t()
            | Asana.Generated.GoalMembershipResponse.t()
            | Asana.Generated.PortfolioMembershipResponse.t()
            | Asana.Generated.ProjectMembershipCompactResponse.t()
            | nil
        }

  @doc """
  Update a membership

  An existing membership can be updated by making a `PUT` request on the membership. Only the fields provided in the `data` block will be updated;
  any unspecified fields will remain unchanged. Memberships on `goals`, `projects`, `portfolios`, `custom_types`, and `custom_fields` can be updated.

  Returns the full record of the updated membership.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The membership to update.
  """
  @spec update_membership(membership_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Memberships.update_membership_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def update_membership(membership_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [membership_gid: membership_gid, body: body],
      call: {Asana.Generated.Memberships, :update_membership},
      url: "/memberships/#{membership_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Memberships, :update_membership_200_json_resp}},
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
  def __fields__(:create_membership_201_json_resp) do
    [
      data:
        {:union,
         [
           {Asana.Generated.CustomFieldMembershipResponse, :t},
           {Asana.Generated.CustomTypeMembershipResponse, :t},
           {Asana.Generated.GoalMembershipResponse, :t},
           {Asana.Generated.PortfolioMembershipResponse, :t},
           {Asana.Generated.ProjectMembershipCompactResponse, :t}
         ]}
    ]
  end

  def __fields__(:delete_membership_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_membership_200_json_resp) do
    [
      data:
        {:union,
         [
           {Asana.Generated.CustomFieldMembershipResponse, :t},
           {Asana.Generated.CustomTypeMembershipResponse, :t},
           {Asana.Generated.GoalMembershipResponse, :t},
           {Asana.Generated.PortfolioMembershipResponse, :t},
           {Asana.Generated.ProjectMembershipCompactResponse, :t}
         ]}
    ]
  end

  def __fields__(:get_memberships_200_json_resp) do
    [
      data: [
        union: [
          {Asana.Generated.CustomFieldMembershipCompact, :t},
          {Asana.Generated.CustomTypeMembershipCompact, :t},
          {Asana.Generated.GoalMembershipCompact, :t},
          {Asana.Generated.PortfolioMembershipCompactResponse, :t},
          {Asana.Generated.ProjectMembershipCompactResponse, :t}
        ]
      ],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end

  def __fields__(:update_membership_200_json_resp) do
    [
      data:
        {:union,
         [
           {Asana.Generated.CustomFieldMembershipResponse, :t},
           {Asana.Generated.CustomTypeMembershipResponse, :t},
           {Asana.Generated.GoalMembershipResponse, :t},
           {Asana.Generated.PortfolioMembershipResponse, :t},
           {Asana.Generated.ProjectMembershipCompactResponse, :t}
         ]}
    ]
  end
end
