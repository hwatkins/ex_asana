defmodule Asana.Generated.GoalRelationships do
  @moduledoc """
  Provides API endpoints related to goal relationships
  """

  @default_client Asana.OperationClient

  @type add_supporting_relationship_200_json_resp :: %{
          data: Asana.Generated.GoalRelationshipResponse.t() | nil
        }

  @doc """
  Add a supporting goal relationship

  Creates a goal relationship by adding a supporting resource to a given goal.

  Returns the newly created goal relationship record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The supporting resource to be added to the goal
  """
  @spec add_supporting_relationship(goal_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.GoalRelationships.add_supporting_relationship_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def add_supporting_relationship(goal_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid, body: body],
      call: {Asana.Generated.GoalRelationships, :add_supporting_relationship},
      url: "/goals/#{goal_gid}/addSupportingRelationship",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.GoalRelationships, :add_supporting_relationship_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_goal_relationship_200_json_resp :: %{
          data: Asana.Generated.GoalRelationshipResponse.t() | nil
        }

  @doc """
  Get a goal relationship

  Returns the complete updated goal relationship record for a single goal relationship.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_goal_relationship(goal_relationship_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.GoalRelationships.get_goal_relationship_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_goal_relationship(goal_relationship_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_relationship_gid: goal_relationship_gid],
      call: {Asana.Generated.GoalRelationships, :get_goal_relationship},
      url: "/goal_relationships/#{goal_relationship_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.GoalRelationships, :get_goal_relationship_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_goal_relationships_200_json_resp :: %{
          data: [Asana.Generated.GoalRelationshipCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get goal relationships

  Returns compact goal relationship records.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `supported_goal`: Globally unique identifier for the supported goal in the goal relationship.
    * `resource_subtype`: If provided, filter to goal relationships with a given resource_subtype.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_goal_relationships(opts :: keyword) ::
          {:ok, Asana.Generated.GoalRelationships.get_goal_relationships_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_goal_relationships(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :limit,
        :offset,
        :opt_fields,
        :opt_pretty,
        :resource_subtype,
        :supported_goal
      ])

    client.request(%{
      args: [],
      call: {Asana.Generated.GoalRelationships, :get_goal_relationships},
      url: "/goal_relationships",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.GoalRelationships, :get_goal_relationships_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type remove_supporting_relationship_200_json_resp :: %{data: map | nil}

  @doc """
  Removes a supporting goal relationship

  Removes a goal relationship for a given parent goal.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  ## Request Body

  **Content Types**: `application/json`

  The supporting resource to be removed from the goal
  """
  @spec remove_supporting_relationship(goal_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.GoalRelationships.remove_supporting_relationship_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def remove_supporting_relationship(goal_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid, body: body],
      call: {Asana.Generated.GoalRelationships, :remove_supporting_relationship},
      url: "/goals/#{goal_gid}/removeSupportingRelationship",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.GoalRelationships, :remove_supporting_relationship_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type update_goal_relationship_200_json_resp :: %{
          data: Asana.Generated.GoalRelationshipResponse.t() | nil
        }

  @doc """
  Update a goal relationship

  An existing goal relationship can be updated by making a PUT request on the URL for
  that goal relationship. Only the fields provided in the `data` block will be updated;
  any unspecified fields will remain unchanged.

  Returns the complete updated goal relationship record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The updated fields for the goal relationship.
  """
  @spec update_goal_relationship(
          goal_relationship_gid :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Asana.Generated.GoalRelationships.update_goal_relationship_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def update_goal_relationship(goal_relationship_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_relationship_gid: goal_relationship_gid, body: body],
      call: {Asana.Generated.GoalRelationships, :update_goal_relationship},
      url: "/goal_relationships/#{goal_relationship_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.GoalRelationships, :update_goal_relationship_200_json_resp}},
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
  def __fields__(:add_supporting_relationship_200_json_resp) do
    [data: {Asana.Generated.GoalRelationshipResponse, :t}]
  end

  def __fields__(:get_goal_relationship_200_json_resp) do
    [data: {Asana.Generated.GoalRelationshipResponse, :t}]
  end

  def __fields__(:get_goal_relationships_200_json_resp) do
    [
      data: [{Asana.Generated.GoalRelationshipCompact, :t}],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end

  def __fields__(:remove_supporting_relationship_200_json_resp) do
    [data: :map]
  end

  def __fields__(:update_goal_relationship_200_json_resp) do
    [data: {Asana.Generated.GoalRelationshipResponse, :t}]
  end
end
