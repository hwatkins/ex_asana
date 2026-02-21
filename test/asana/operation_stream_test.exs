defmodule Asana.OperationStreamTest do
  use ExUnit.Case, async: true

  alias Asana.OperationStream

  test "list/2 follows offset-based pages" do
    operation = fn opts ->
      case Keyword.get(opts, :offset) do
        nil -> {:ok, %{"data" => [1], "next_page" => %{"offset" => "n1"}}}
        "n1" -> {:ok, %{"data" => [2], "next_page" => nil}}
      end
    end

    assert [1, 2] =
             operation
             |> OperationStream.list(project: "project-1")
             |> Enum.to_list()
  end

  test "list/2 preserves user options while adding offset" do
    parent = self()

    operation = fn opts ->
      send(parent, {:opts, opts})
      {:ok, %{"data" => [], "next_page" => nil}}
    end

    operation
    |> OperationStream.list(project: "project-1", limit: 50)
    |> Enum.to_list()

    assert_received {:opts, opts}
    assert opts[:project] == "project-1"
    assert opts[:limit] == 50
    refute Keyword.has_key?(opts, :offset)
  end
end
