defmodule Asana.Pagination do
  @moduledoc """
  Helpers for turning cursor-paginated API responses into streams.
  """

  alias Asana.Error, as: AsanaError

  @type page :: %{data: list(), next_offset: String.t() | nil}
  @type page_fetcher :: (String.t() | nil -> {:ok, page()} | {:error, term()})

  @spec stream(page_fetcher()) :: Enumerable.t()
  def stream(page_fetcher) when is_function(page_fetcher, 1) do
    Stream.resource(
      fn -> nil end,
      fn
        :halt ->
          {:halt, :halt}

        offset ->
          case page_fetcher.(offset) do
            {:ok, %{data: data, next_offset: nil}} ->
              {data, :halt}

            {:ok, %{data: data, next_offset: next_offset}} ->
              {data, next_offset}

            {:error, %AsanaError{} = error} ->
              raise error

            {:error, error} ->
              raise AsanaError.request_failure(error)
          end
      end,
      fn _ -> :ok end
    )
  end
end
