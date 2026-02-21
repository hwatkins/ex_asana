defmodule Asana.Generated.CustomFieldSettings do
  @moduledoc """
  Provides API endpoints related to custom field settings
  """

  @default_client Asana.OperationClient

  @type get_custom_field_settings_for_goal_200_json_resp :: %{
          data: [Asana.Generated.CustomFieldSettingResponse.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get a goal's custom fields

  <b>Required scope: </b><code>goals:read</code>

  Returns a list of all of the custom fields settings on a goal, in compact form. Note that, as in all queries to collections which return compact representation, `opt_fields` can be used to include more data than is returned in the compact representation. See the [documentation for input/output options](https://developers.asana.com/docs/inputoutput-options) for more information.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_custom_field_settings_for_goal(goal_gid :: String.t(), opts :: keyword) ::
          {:ok,
           Asana.Generated.CustomFieldSettings.get_custom_field_settings_for_goal_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_custom_field_settings_for_goal(goal_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [goal_gid: goal_gid],
      call: {Asana.Generated.CustomFieldSettings, :get_custom_field_settings_for_goal},
      url: "/goals/#{goal_gid}/custom_field_settings",
      method: :get,
      query: query,
      response: [
        {200,
         {Asana.Generated.CustomFieldSettings, :get_custom_field_settings_for_goal_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_custom_field_settings_for_portfolio_200_json_resp :: %{
          data: [Asana.Generated.CustomFieldSettingResponse.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get a portfolio's custom fields

  <b>Required scope: </b><code>portfolios:read</code>

  Returns a list of all of the custom fields settings on a portfolio, in compact form.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_custom_field_settings_for_portfolio(portfolio_gid :: String.t(), opts :: keyword) ::
          {:ok,
           Asana.Generated.CustomFieldSettings.get_custom_field_settings_for_portfolio_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_custom_field_settings_for_portfolio(portfolio_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [portfolio_gid: portfolio_gid],
      call: {Asana.Generated.CustomFieldSettings, :get_custom_field_settings_for_portfolio},
      url: "/portfolios/#{portfolio_gid}/custom_field_settings",
      method: :get,
      query: query,
      response: [
        {200,
         {Asana.Generated.CustomFieldSettings,
          :get_custom_field_settings_for_portfolio_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_custom_field_settings_for_project_200_json_resp :: %{
          data: [Asana.Generated.CustomFieldSettingResponse.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get a project's custom fields

  <b>Required scope: </b><code>projects:read</code>

  Returns a list of all of the custom fields settings on a project, in compact form. Note that, as in all queries to collections which return compact representation, `opt_fields` can be used to include more data than is returned in the compact representation. See the [documentation for input/output options](https://developers.asana.com/docs/inputoutput-options) for more information.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_custom_field_settings_for_project(project_gid :: String.t(), opts :: keyword) ::
          {:ok,
           Asana.Generated.CustomFieldSettings.get_custom_field_settings_for_project_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_custom_field_settings_for_project(project_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [project_gid: project_gid],
      call: {Asana.Generated.CustomFieldSettings, :get_custom_field_settings_for_project},
      url: "/projects/#{project_gid}/custom_field_settings",
      method: :get,
      query: query,
      response: [
        {200,
         {Asana.Generated.CustomFieldSettings,
          :get_custom_field_settings_for_project_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_custom_field_settings_for_team_200_json_resp :: %{
          data: [Asana.Generated.CustomFieldSettingResponse.t()] | nil
        }

  @doc """
  Get a team's custom fields

  <b>Required scope: </b><code>teams:read</code>

  Returns a list of all of the custom fields settings on a team, in compact form. Note that, as in all queries to collections which return compact representation, `opt_fields` can be used to include more data than is returned in the compact representation. See the [documentation for input/output options](https://developers.asana.com/docs/inputoutput-options) for more information.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_custom_field_settings_for_team(team_gid :: String.t(), opts :: keyword) ::
          {:ok,
           Asana.Generated.CustomFieldSettings.get_custom_field_settings_for_team_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_custom_field_settings_for_team(team_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [team_gid: team_gid],
      call: {Asana.Generated.CustomFieldSettings, :get_custom_field_settings_for_team},
      url: "/teams/#{team_gid}/custom_field_settings",
      method: :get,
      query: query,
      response: [
        {200,
         {Asana.Generated.CustomFieldSettings, :get_custom_field_settings_for_team_200_json_resp}},
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
  def __fields__(:get_custom_field_settings_for_goal_200_json_resp) do
    [
      data: [{Asana.Generated.CustomFieldSettingResponse, :t}],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end

  def __fields__(:get_custom_field_settings_for_portfolio_200_json_resp) do
    [
      data: [{Asana.Generated.CustomFieldSettingResponse, :t}],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end

  def __fields__(:get_custom_field_settings_for_project_200_json_resp) do
    [
      data: [{Asana.Generated.CustomFieldSettingResponse, :t}],
      next_page: {Asana.Generated.NextPage, :t}
    ]
  end

  def __fields__(:get_custom_field_settings_for_team_200_json_resp) do
    [data: [{Asana.Generated.CustomFieldSettingResponse, :t}]]
  end
end
