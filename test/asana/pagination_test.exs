defmodule Asana.PaginationTest do
  use ExUnit.Case, async: true

  alias Asana.Pagination

  test "stream/1 requests next pages using offset state" do
    page_fetcher = fn
      nil -> {:ok, %{data: [1], next_offset: "n1"}}
      "n1" -> {:ok, %{data: [2], next_offset: nil}}
    end

    assert [1, 2] =
             page_fetcher
             |> Pagination.stream()
             |> Enum.to_list()
  end

  test "stream/1 raises Asana.Error on page fetch error" do
    error = %Asana.Error{status: 500, message: "boom", body: %{}}

    assert_raise Asana.Error, "boom", fn ->
      fn _offset -> {:error, error} end
      |> Pagination.stream()
      |> Enum.to_list()
    end
  end
end
