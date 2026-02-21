defmodule Asana.WorkspacesTest do
  use ExUnit.Case, async: true

  alias Asana.Workspaces

  test "list_openapi/1 streams workspaces" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})

      case get_in(opts, [:params, :offset]) do
        nil ->
          {:ok,
           %{
             status: 200,
             body: %{"data" => [%{"gid" => "w1"}], "next_page" => %{"offset" => "n1"}}
           }}

        "n1" ->
          {:ok, %{status: 200, body: %{"data" => [%{"gid" => "w2"}], "next_page" => nil}}}
      end
    end

    assert [
             %Asana.Workspace{gid: "w1"},
             %Asana.Workspace{gid: "w2"}
           ] =
             Workspaces.list_openapi(
               token: "token",
               requester: requester,
               opt_fields: ["gid", "name"]
             )
             |> Enum.to_list()

    assert_received {:request, req}
    assert req[:auth] == {:bearer, "token"}
    assert req[:params][:opt_fields] == "gid,name"
  end
end
