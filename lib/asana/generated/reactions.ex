defmodule Asana.Generated.Reactions do
  @moduledoc """
  Provides API endpoint related to reactions
  """

  @default_client Asana.OperationClient

  @type get_reactions_on_object_200_json_resp :: %{
          data: [Asana.Generated.ReactionCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get reactions with an emoji base on an object.

  Returns the reactions with a specified emoji base character on the object.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `target`: Globally unique identifier for object to fetch reactions from. Must be a GID for a status update or story.
    * `emoji_base`: Only return reactions with this emoji base character.

  """
  @spec get_reactions_on_object(opts :: keyword) ::
          {:ok, Asana.Generated.Reactions.get_reactions_on_object_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_reactions_on_object(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:emoji_base, :limit, :offset, :opt_pretty, :target])

    client.request(%{
      args: [],
      call: {Asana.Generated.Reactions, :get_reactions_on_object},
      url: "/reactions",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Reactions, :get_reactions_on_object_200_json_resp}},
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
  def __fields__(:get_reactions_on_object_200_json_resp) do
    [data: [{Asana.Generated.ReactionCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end
end
