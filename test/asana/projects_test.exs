defmodule Asana.ProjectsTest do
  use ExUnit.Case, async: true

  alias Asana.Projects

  test "list_openapi/2 streams projects in a workspace" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})

      case get_in(opts, [:params, :offset]) do
        nil ->
          {:ok,
           %{
             status: 200,
             body: %{"data" => [%{"gid" => "p1"}], "next_page" => %{"offset" => "n1"}}
           }}

        "n1" ->
          {:ok, %{status: 200, body: %{"data" => [%{"gid" => "p2"}], "next_page" => nil}}}
      end
    end

    assert [
             %Asana.Project{gid: "p1"},
             %Asana.Project{gid: "p2"}
           ] =
             Projects.list_openapi("workspace-1",
               token: "token",
               requester: requester,
               opt_fields: ["gid", "name"]
             )
             |> Enum.to_list()

    assert_received {:request, req}
    assert req[:auth] == {:bearer, "token"}
    assert req[:params][:workspace] == "workspace-1"
    assert req[:params][:opt_fields] == "gid,name"
  end
end
