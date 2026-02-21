defmodule Asana.DecodeTest do
  use ExUnit.Case, async: true

  alias Asana.Decode
  alias Asana.Task

  test "decodes task response into typed struct and preserves unknown fields in __info__" do
    payload = %{
      "gid" => "task-1",
      "name" => "Ship client",
      "completed_at" => "2025-01-02T03:04:05Z",
      "due_on" => "2025-01-20",
      "assigned_by" => %{"gid" => "u2", "name" => "Assigner", "resource_type" => "user"},
      "created_by" => %{"gid" => "u3", "resource_type" => "user"},
      "completed_by" => %{"gid" => "u4", "name" => "Completer", "resource_type" => "user"},
      "external" => %{"gid" => "jira-22", "data" => "ABC-22"},
      "memberships" => [
        %{
          "project" => %{"gid" => "p1", "name" => "Roadmap", "resource_type" => "project"},
          "section" => %{"gid" => "s1", "name" => "Doing", "resource_type" => "section"}
        }
      ],
      "dependencies" => [%{"gid" => "task-0", "resource_type" => "task"}],
      "dependents" => [%{"gid" => "task-2", "resource_type" => "task"}],
      "likes" => [%{"gid" => "like-1", "user" => %{"gid" => "u1", "resource_type" => "user"}}],
      "future_field" => "keep-me"
    }

    decoded = Decode.decode(payload, {Task, :response})

    assert %Task{} = decoded
    assert decoded.gid == "task-1"
    assert decoded.name == "Ship client"
    assert %DateTime{} = decoded.completed_at
    assert %Date{} = decoded.due_on

    assert %Asana.Generated.TaskResponseAssignedBy{gid: "u2", name: "Assigner"} =
             decoded.assigned_by

    assert %Asana.Generated.TaskResponseCreatedBy{gid: "u3"} = decoded.created_by

    assert %Asana.Generated.TaskResponseCompletedBy{gid: "u4", name: "Completer"} =
             decoded.completed_by

    assert %Asana.Generated.TaskResponseExternal{gid: "jira-22", data: "ABC-22"} =
             decoded.external

    assert [%Asana.Generated.TaskResponseMemberships{} = membership] = decoded.memberships
    assert %Asana.Generated.ProjectCompact{gid: "p1"} = membership.project
    assert %Asana.Generated.SectionCompact{gid: "s1"} = membership.section
    assert [%Asana.Generated.AsanaResource{gid: "task-0"}] = decoded.dependencies
    assert [%Asana.Generated.AsanaResource{gid: "task-2"}] = decoded.dependents
    assert [%Asana.Generated.Like{gid: "like-1"}] = decoded.likes
    assert decoded.__info__ == %{"future_field" => "keep-me"}
  end
end
