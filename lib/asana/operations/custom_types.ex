defmodule Asana.CustomTypes do
  @moduledoc """
  Provides API endpoints related to custom types
  """

  @default_client Asana.Client

  @type get_custom_type_200_json_resp :: %{__info__: map, data: Asana.CustomType.response() | nil}

  @doc """
  Get a custom type

  Returns the complete custom type record for a single custom type.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_custom_type(custom_type_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.CustomTypes.get_custom_type_200_json_resp()} | {:error, Asana.Error.t()}
  def get_custom_type(custom_type_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [custom_type_gid: custom_type_gid],
      call: {Asana.CustomTypes, :get_custom_type},
      url: "/custom_types/#{custom_type_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.CustomTypes, :get_custom_type_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_custom_types_200_json_resp :: %{
          __info__: map,
          data: [Asana.CustomType.response()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get all custom types associated with an object

  Returns a list of all of the custom types associated with an object. Currently, only projects are supported. Note that, as in all queries to collections which return compact representation, `opt_fields` can be used to include more data than is returned in the compact representation. See the [documentation for input/output options](https://developers.asana.com/docs/inputoutput-options) for more information.

  ## Options

    * `project`: Globally unique identifier for the project, which is used as a filter when retrieving all custom types.
    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_custom_types(opts :: keyword) ::
          {:ok, Asana.CustomTypes.get_custom_types_200_json_resp()} | {:error, Asana.Error.t()}
  def get_custom_types(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :project])

    client.request(%{
      args: [],
      call: {Asana.CustomTypes, :get_custom_types},
      url: "/custom_types",
      method: :get,
      query: query,
      response: [
        {200, {Asana.CustomTypes, :get_custom_types_200_json_resp}},
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
  def __fields__(:get_custom_type_200_json_resp) do
    [data: {Asana.CustomType, :response}]
  end

  def __fields__(:get_custom_types_200_json_resp) do
    [data: [{Asana.CustomType, :response}], next_page: {Asana.NextPage, :t}]
  end
end
