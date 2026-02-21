defmodule Asana.Reactions do
  @moduledoc """
  Provides API endpoint related to reactions
  """

  @default_client Asana.Client

  @type get_reactions_on_object_200_json_resp :: %{
          __info__: map,
          data: [Asana.Reaction.compact()] | nil,
          next_page: Asana.NextPage.t() | nil
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
          {:ok, Asana.Reactions.get_reactions_on_object_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_reactions_on_object(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:emoji_base, :limit, :offset, :opt_pretty, :target])

    client.request(%{
      args: [],
      call: {Asana.Reactions, :get_reactions_on_object},
      url: "/reactions",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Reactions, :get_reactions_on_object_200_json_resp}},
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
  def __fields__(:get_reactions_on_object_200_json_resp) do
    [data: [{Asana.Reaction, :compact}], next_page: {Asana.NextPage, :t}]
  end
end
