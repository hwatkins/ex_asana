defmodule Asana.TasksTest do
  use ExUnit.Case, async: true

  alias Asana.Client
  alias Asana.Tasks

  test "list/3 fetches pages lazily and returns only needed items" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})

      offset = get_in(opts, [:params, "offset"])

      case offset do
        nil ->
          {:ok,
           %{
             status: 200,
             body: %{"data" => [%{"gid" => "1"}], "next_page" => %{"offset" => "n1"}}
           }}

        "n1" ->
          {:ok,
           %{
             status: 200,
             body: %{"data" => [%{"gid" => "2"}], "next_page" => %{"offset" => "n2"}}
           }}

        "n2" ->
          {:ok, %{status: 200, body: %{"data" => [%{"gid" => "3"}], "next_page" => nil}}}
      end
    end

    client = Client.new(token: "token", requester: requester)

    assert [%Asana.Task{gid: "1"}] =
             client
             |> Tasks.list("project-1")
             |> Enum.take(1)

    assert_received {:request, first_req}
    assert first_req[:url] == "/tasks"
    assert first_req[:params]["project"] == "project-1"
    refute_received {:request, _second_req}
  end

  test "list/3 follows next_page offset until exhausted" do
    requester = fn opts ->
      offset = get_in(opts, [:params, "offset"])

      case offset do
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

    client = Client.new(token: "token", requester: requester)

    assert [%Asana.Task{gid: "1"}, %Asana.Task{gid: "2"}] =
             client
             |> Tasks.list("project-1")
             |> Enum.to_list()
  end

  test "list/3 includes opt_fields in params when provided" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})
      {:ok, %{status: 200, body: %{"data" => [], "next_page" => nil}}}
    end

    client = Client.new(token: "token", requester: requester)

    client
    |> Tasks.list("project-1", opt_fields: ["gid", "name"])
    |> Enum.to_list()

    assert_received {:request, req}
    assert req[:params]["opt_fields"] == "gid,name"
  end
end
