defmodule Asana.ResourceSchemaTest do
  use ExUnit.Case, async: true

  alias Asana.Decode
  alias Asana.Project
  alias Asana.User
  alias Asana.Workspace

  test "project response fields include inherited allOf fields" do
    fields = Project.__fields__(:response)
    keys = Keyword.keys(fields)

    assert length(fields) >= 30
    assert :gid in keys
    assert :name in keys
    assert :archived in keys
    assert :created_at in keys
    assert :modified_at in keys
    assert :owner in keys
    assert :team in keys
    assert :workspace in keys
  end

  test "decode project response preserves unknown fields in __info__" do
    payload = %{
      "gid" => "p1",
      "name" => "Project 1",
      "archived" => false,
      "due_on" => "2025-01-20",
      "created_at" => "2025-01-02T03:04:05Z",
      "future_field" => "keep-me"
    }

    decoded = Decode.decode(payload, {Project, :response})

    assert %Project{} = decoded
    assert decoded.gid == "p1"
    assert decoded.name == "Project 1"
    assert decoded.archived == false
    assert %Date{} = decoded.due_on
    assert %DateTime{} = decoded.created_at
    assert decoded.__info__ == %{"future_field" => "keep-me"}
  end

  test "decode user and workspace responses preserve unknown fields in __info__" do
    user =
      Decode.decode(
        %{
          "gid" => "u1",
          "name" => "User 1",
          "email" => "u1@example.com",
          "future_user_field" => "keep-user"
        },
        {User, :response}
      )

    workspace =
      Decode.decode(
        %{
          "gid" => "w1",
          "name" => "Workspace 1",
          "is_organization" => true,
          "future_workspace_field" => "keep-workspace"
        },
        {Workspace, :response}
      )

    assert %User{gid: "u1", name: "User 1", email: "u1@example.com"} = user
    assert user.__info__ == %{"future_user_field" => "keep-user"}

    assert %Workspace{gid: "w1", name: "Workspace 1", is_organization: true} = workspace
    assert workspace.__info__ == %{"future_workspace_field" => "keep-workspace"}
  end
end
