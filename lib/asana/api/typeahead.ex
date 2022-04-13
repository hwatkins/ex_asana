# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Api.Typeahead do
  @moduledoc """
  API calls for all endpoints tagged `Typeahead`.
  """

  alias Asana.Connection
  import Asana.RequestBuilder


  @doc """
  Retrieve objects via typeahead
  Retrieves objects in the workspace based via an auto-completion/typeahead search algorithm. This feature is meant to provide results quickly, so do not rely on this API to provide extremely accurate search results. The result set is limited to a single page of results with a maximum size, so you won’t be able to fetch large numbers of results.  The typeahead search API provides search for objects from a single workspace. This endpoint should be used to query for objects when creating an auto-completion/typeahead search feature. This API is meant to provide results quickly and should not be relied upon for accurate or exhaustive search results. The results sets are limited in size and cannot be paginated.  Queries return a compact representation of each object which is typically the id and name fields. Interested in a specific set of fields or all of the fields?! Of course you are. Use field selectors to manipulate what data is included in a response.

  ## Parameters

  - connection (Asana.Connection): Connection to server
  - workspace_gid (String.t): Globally unique identifier for the workspace or organization.
  - type (String.t): The type of values the typeahead should return. You can choose from one of the following: `custom_field`, `project`, `tag`, `task`, and `user`. Note that unlike in the names of endpoints, the types listed here are in singular form (e.g. `task`). Using multiple types is not yet supported.
  - opts (KeywordList): [optional] Optional parameters
    - :query (String.t): The string that will be used to search for relevant objects. If an empty string is passed in, the API will currently return an empty result set.
    - :count (integer()): The number of results to return. The default is 20 if this parameter is omitted, with a minimum of 1 and a maximum of 100. If there are fewer results found than requested, all will be returned.
    - :opt_pretty (boolean()): Provides the response in “pretty” output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    - :opt_fields ([String.t]): Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
    - :opt_expand ([String.t]): Query results and sub-objects are returned in compact form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. If the fields option is also used, it will take precedence over the expand option and prevent expansion.
    - :limit (integer()): The number of objects to return per page. The value must be between 1 and 100.
    - :offset (String.t): An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
  ## Returns

  {:ok, Asana.Model.AsanaObjectArray.t} on success
  {:error, Tesla.Env.t} on failure
  """
  @spec get_typeahead(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, Asana.Model.AsanaObjectArray.t} | {:ok, Asana.Model.Error.t} | {:error, Tesla.Env.t}
  def get_typeahead(connection, workspace_gid, type, opts \\ []) do
    optional_params = %{
      :"query" => :query,
      :"count" => :query,
      :"opt_pretty" => :query,
      :"opt_fields" => :query,
      :"opt_expand" => :query,
      :"limit" => :query,
      :"offset" => :query
    }
    %{}
    |> method(:get)
    |> url("/workspaces/#{workspace_gid}/typeahead")
    |> add_param(:query, :"type", type)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> evaluate_response([
      { 200, %Asana.Model.AsanaObjectArray{}},
      { 400, %Asana.Model.Error{}},
      { 401, %Asana.Model.Error{}},
      { 403, %Asana.Model.Error{}},
      { 404, %Asana.Model.Error{}},
      { "5XX", %Asana.Model.Error{}},
      { :default, %Asana.Model.Error{}}
    ])
  end
end
