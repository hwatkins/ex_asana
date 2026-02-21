defmodule Asana.Generated.TimePeriods do
  @moduledoc """
  Provides API endpoints related to time periods
  """

  @default_client Asana.OperationClient

  @type get_time_period_200_json_resp :: %{data: Asana.Generated.TimePeriodResponse.t() | nil}

  @doc """
  Get a time period

  Returns the full record for a single time period.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_time_period(time_period_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.TimePeriods.get_time_period_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_time_period(time_period_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [time_period_gid: time_period_gid],
      call: {Asana.Generated.TimePeriods, :get_time_period},
      url: "/time_periods/#{time_period_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.TimePeriods, :get_time_period_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_time_periods_200_json_resp :: %{
          data: [Asana.Generated.TimePeriodCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get time periods

  Returns compact time period records.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `start_on`: ISO 8601 date string
    * `end_on`: ISO 8601 date string
    * `workspace`: Globally unique identifier for the workspace.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_time_periods(opts :: keyword) ::
          {:ok, Asana.Generated.TimePeriods.get_time_periods_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_time_periods(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :end_on,
        :limit,
        :offset,
        :opt_fields,
        :opt_pretty,
        :start_on,
        :workspace
      ])

    client.request(%{
      args: [],
      call: {Asana.Generated.TimePeriods, :get_time_periods},
      url: "/time_periods",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.TimePeriods, :get_time_periods_200_json_resp}},
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
  def __fields__(:get_time_period_200_json_resp) do
    [data: {Asana.Generated.TimePeriodResponse, :t}]
  end

  def __fields__(:get_time_periods_200_json_resp) do
    [data: [{Asana.Generated.TimePeriodCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end
end
