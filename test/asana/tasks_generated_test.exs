defmodule Asana.TasksGeneratedTest do
  use ExUnit.Case, async: true

  alias Asana.Tasks

  test "list_generated/3 streams across pages and normalizes opt_fields" do
    operation = fn opts ->
      case Keyword.get(opts, :offset) do
        nil ->
          assert opts[:project] == "project-1"
          assert opts[:opt_fields] == "gid,name"
          {:ok, %{"data" => [%{"gid" => "1"}], "next_page" => %{"offset" => "n1"}}}

        "n1" ->
          assert opts[:project] == "project-1"
          {:ok, %{"data" => [%{"gid" => "2"}], "next_page" => nil}}
      end
    end

    assert [%Asana.Task{gid: "1"}, %Asana.Task{gid: "2"}] =
             Tasks.list_generated(operation, "project-1", opt_fields: ["gid", "name"])
             |> Enum.to_list()
  end

  test "list_openapi/2 streams via generated tasks operation" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})

      case get_in(opts, [:params, :offset]) do
        nil ->
          {:ok,
           %{
             status: 200,
             body: %{"data" => [%{"gid" => "1"}], "next_page" => %{"offset" => "n1"}}
           }}

        "n1" ->
          {:ok, %{status: 200, body: %{"data" => [%{"gid" => "2"}], "next_page" => nil}}}
      end
    end

    assert [%Asana.Task{gid: "1"}, %Asana.Task{gid: "2"}] =
             Tasks.list_openapi("project-1",
               token: "token",
               requester: requester,
               opt_fields: ["gid", "name"]
             )
             |> Enum.to_list()

    assert_received {:request, req}
    assert req[:auth] == {:bearer, "token"}
    assert req[:params][:project] == "project-1"
    assert req[:params][:opt_fields] == "gid,name"
  end
end
