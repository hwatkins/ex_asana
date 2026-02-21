defmodule Asana.Generated.PortfolioMemberships do
  @moduledoc """
  Provides API endpoints related to portfolio memberships
  """

  @default_client Asana.OperationClient

  @type get_portfolio_membership_200_json_resp :: %{
          data: Asana.Generated.DeprecatedPortfolioMembershipResponse.t() | nil
        }

  @doc """
  Get a portfolio membership

  Returns the complete portfolio record for a single portfolio membership.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_portfolio_membership(portfolio_membership_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.PortfolioMemberships.get_portfolio_membership_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_portfolio_membership(portfolio_membership_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [portfolio_membership_gid: portfolio_membership_gid],
      call: {Asana.Generated.PortfolioMemberships, :get_portfolio_membership},
      url: "/portfolio_memberships/#{portfolio_membership_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.PortfolioMemberships, :get_portfolio_membership_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_portfolio_memberships_200_json_resp :: %{
          data: [Asana.Generated.DeprecatedPortfolioMembershipCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get multiple portfolio memberships

  Returns a list of portfolio memberships in compact representation. You must specify `portfolio`, `portfolio` and `user`, or `workspace` and `user`.

  ## Options

    * `portfolio`: The portfolio to filter results on.
    * `workspace`: The workspace to filter results on.
    * `user`: A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_portfolio_memberships(opts :: keyword) ::
          {:ok, Asana.Generated.PortfolioMemberships.get_portfolio_memberships_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_portfolio_memberships(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :limit,
        :offset,
        :opt_fields,
        :opt_pretty,
        :portfolio,
        :user,
        :workspace
      ])

    client.request(%{
      args: [],
      call: {Asana.Generated.PortfolioMemberships, :get_portfolio_memberships},
      url: "/portfolio_memberships",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.PortfolioMemberships, :get_portfolio_memberships_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_portfolio_memberships_for_portfolio_200_json_resp :: %{
          data: [Asana.Generated.DeprecatedPortfolioMembershipCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get memberships from a portfolio

  Returns the compact portfolio membership records for the portfolio.

  ## Options

    * `user`: A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_portfolio_memberships_for_portfolio(portfolio_gid :: String.t(), opts :: keyword) ::
          {:ok,
           Asana.Generated.PortfolioMemberships.get_portfolio_memberships_for_portfolio_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_portfolio_memberships_for_portfolio(portfolio_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :user])

    client.request(%{
      args: [portfolio_gid: portfolio_gid],
      call: {Asana.Generated.PortfolioMemberships, :get_portfolio_memberships_for_portfolio},
      url: "/portfolios/#{portfolio_gid}/portfolio_memberships",
      method: :get,
      query: query,
      response: [
        {200,
         {Asana.Generated.PortfolioMemberships,
          :get_portfolio_memberships_for_portfolio_200_json_resp}},
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
  def __fields__(:get_portfolio_membership_200_json_resp) do
    [data: {Asana.Generated.DeprecatedPortfolioMembershipResponse, :t}]
  end

  def __fields__(:get_portfolio_memberships_200_json_resp) do
    [
      data: [{Asana.Generated.DeprecatedPortfolioMembershipCompact, :t}],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end

  def __fields__(:get_portfolio_memberships_for_portfolio_200_json_resp) do
    [
      data: [{Asana.Generated.DeprecatedPortfolioMembershipCompact, :t}],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end
end
