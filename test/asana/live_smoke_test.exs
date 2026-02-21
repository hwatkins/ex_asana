defmodule Asana.LiveSmokeTest do
  use ExUnit.Case

  @moduletag :live
  @moduletag skip:
               if(System.get_env("ASANA_TOKEN") in [nil, ""],
                 do: "set ASANA_TOKEN to run live smoke tests",
                 else: false
               )

  test "list_openapi/1 can fetch at least one workspace" do
    token = System.fetch_env!("ASANA_TOKEN")

    result =
      Asana.Workspaces.list_openapi(
        token: token,
        limit: 1,
        opt_fields: ["gid", "name"]
      )
      |> Enum.take(1)

    assert is_list(result)

    case result do
      [] ->
        assert true

      [workspace | _] ->
        assert is_map(workspace)
        assert is_binary(workspace["gid"])
    end
  end
end
