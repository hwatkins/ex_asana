defmodule Asana.OpenAPIConvenienceTest do
  use ExUnit.Case, async: true

  test "tasks get/create/complete/delete wrappers" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})

      case {opts[:method], opts[:url]} do
        {:get, "/tasks/t1"} ->
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "t1", "name" => "Task 1"}}}}

        {:post, "/tasks"} ->
          assert opts[:json] == %{data: %{name: "New Task", workspace: "w1"}}
          {:ok, %{status: 201, body: %{"data" => %{"gid" => "t2", "name" => "New Task"}}}}

        {:put, "/tasks/t1"} ->
          assert opts[:json] == %{data: %{completed: true}}
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "t1", "completed" => true}}}}

        {:delete, "/tasks/t1"} ->
          {:ok, %{status: 200, body: %{"data" => %{}}}}
      end
    end

    assert {:ok, %Asana.Task{gid: "t1", name: "Task 1"}} =
             Asana.Tasks.get_openapi("t1",
               token: "token",
               requester: requester,
               opt_fields: ["gid", "name"]
             )

    assert_received {:request, get_req}
    assert get_req[:params][:opt_fields] == "gid,name"

    assert {:ok, %Asana.Task{gid: "t2", name: "New Task"}} =
             Asana.Tasks.create_openapi(%{name: "New Task", workspace: "w1"},
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.Task{gid: "t1", completed: true}} =
             Asana.Tasks.complete_openapi("t1", token: "token", requester: requester)

    assert {:ok, %{}} = Asana.Tasks.delete_openapi("t1", token: "token", requester: requester)
  end

  test "projects get/create/update/delete/archive/member/follower wrappers" do
    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:get, "/projects/p1"} ->
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "p1", "name" => "Project 1"}}}}

        {:post, "/projects"} ->
          assert opts[:json] == %{data: %{name: "Project 2", workspace: "w1"}}
          {:ok, %{status: 201, body: %{"data" => %{"gid" => "p2"}}}}

        {:put, "/projects/p1"} ->
          case opts[:json] do
            %{data: %{name: "Renamed"}} ->
              {:ok, %{status: 200, body: %{"data" => %{"gid" => "p1", "name" => "Renamed"}}}}

            %{data: %{archived: true}} ->
              {:ok, %{status: 200, body: %{"data" => %{"gid" => "p1", "archived" => true}}}}

            %{data: %{archived: false}} ->
              {:ok, %{status: 200, body: %{"data" => %{"gid" => "p1", "archived" => false}}}}
          end

        {:delete, "/projects/p1"} ->
          {:ok, %{status: 200, body: %{"data" => %{}}}}

        {:post, "/projects/p1/addMembers"} ->
          assert opts[:json] == %{data: %{members: ["u2"]}}

          {:ok,
           %{
             status: 200,
             body: %{
               "data" => %{
                 "gid" => "p1",
                 "members" => [%{"gid" => "u2", "name" => "User 2", "resource_type" => "user"}]
               }
             }
           }}

        {:post, "/projects/p1/removeMembers"} ->
          assert opts[:json] == %{data: %{members: ["u2"]}}
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "p1", "members" => []}}}}

        {:post, "/projects/p1/addFollowers"} ->
          assert opts[:json] == %{data: %{followers: ["u3"]}}

          {:ok,
           %{
             status: 200,
             body: %{
               "data" => %{
                 "gid" => "p1",
                 "followers" => [%{"gid" => "u3", "name" => "User 3", "resource_type" => "user"}]
               }
             }
           }}

        {:post, "/projects/p1/removeFollowers"} ->
          assert opts[:json] == %{data: %{followers: ["u3"]}}
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "p1", "followers" => []}}}}
      end
    end

    assert {:ok, %Asana.Project{gid: "p1", name: "Project 1"}} =
             Asana.Projects.get_openapi("p1", token: "token", requester: requester)

    assert {:ok, %Asana.Project{gid: "p2"}} =
             Asana.Projects.create_openapi(%{name: "Project 2", workspace: "w1"},
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.Project{gid: "p1", name: "Renamed"}} =
             Asana.Projects.update_openapi("p1", %{name: "Renamed"},
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.Project{gid: "p1", archived: true}} =
             Asana.Projects.archive_openapi("p1", token: "token", requester: requester)

    assert {:ok, %Asana.Project{gid: "p1", archived: false}} =
             Asana.Projects.unarchive_openapi("p1", token: "token", requester: requester)

    assert {:ok, %Asana.Project{gid: "p1", members: [%Asana.Generated.UserCompact{gid: "u2"}]}} =
             Asana.Projects.add_members_openapi("p1", %{members: ["u2"]},
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.Project{gid: "p1", members: []}} =
             Asana.Projects.remove_members_openapi("p1", %{members: ["u2"]},
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.Project{gid: "p1", followers: [%Asana.Generated.UserCompact{gid: "u3"}]}} =
             Asana.Projects.add_followers_openapi("p1", %{followers: ["u3"]},
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.Project{gid: "p1", followers: []}} =
             Asana.Projects.remove_followers_openapi("p1", %{followers: ["u3"]},
               token: "token",
               requester: requester
             )

    assert {:ok, %{}} = Asana.Projects.delete_openapi("p1", token: "token", requester: requester)
  end

  test "users and workspaces get/update wrappers" do
    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:get, "/users/u1"} ->
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "u1", "name" => "User"}}}}

        {:put, "/users/u1"} ->
          assert opts[:json] == %{data: %{name: "User 2"}}
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "u1", "name" => "User 2"}}}}

        {:get, "/workspaces/w1/users/u1"} ->
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "u1", "name" => "Workspace User"}}}}

        {:put, "/workspaces/w1/users/u1"} ->
          assert opts[:json] == %{data: %{name: "Workspace User 2"}}

          {:ok, %{status: 200, body: %{"data" => %{"gid" => "u1", "name" => "Workspace User 2"}}}}

        {:get, "/workspaces/w1"} ->
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "w1", "name" => "Workspace"}}}}

        {:put, "/workspaces/w1"} ->
          assert opts[:json] == %{data: %{name: "Workspace 2"}}
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "w1", "name" => "Workspace 2"}}}}

        {:post, "/workspaces/w1/addUser"} ->
          assert opts[:json] == %{data: %{user: "u2"}}

          {:ok,
           %{
             status: 200,
             body: %{
               "data" => %{"gid" => "u2", "name" => "Added User", "email" => "u2@example.com"}
             }
           }}

        {:post, "/workspaces/w1/removeUser"} ->
          assert opts[:json] == %{data: %{user: "u2"}}
          {:ok, %{status: 200, body: %{"data" => %{}}}}
      end
    end

    assert {:ok, %Asana.User{gid: "u1", name: "User"}} =
             Asana.Users.get_openapi("u1", token: "token", requester: requester)

    assert {:ok, %Asana.User{gid: "u1", name: "User 2"}} =
             Asana.Users.update_openapi("u1", %{name: "User 2"},
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.User{gid: "u1", name: "Workspace User"}} =
             Asana.Users.get_for_workspace_openapi("w1", "u1",
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.User{gid: "u1", name: "Workspace User 2"}} =
             Asana.Users.update_for_workspace_openapi("w1", "u1", %{name: "Workspace User 2"},
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.Workspace{gid: "w1", name: "Workspace"}} =
             Asana.Workspaces.get_openapi("w1", token: "token", requester: requester)

    assert {:ok, %Asana.Workspace{gid: "w1", name: "Workspace 2"}} =
             Asana.Workspaces.update_openapi("w1", %{name: "Workspace 2"},
               token: "token",
               requester: requester
             )

    assert {:ok, %Asana.User{gid: "u2", name: "Added User", email: "u2@example.com"}} =
             Asana.Workspaces.add_user_openapi("w1", %{user: "u2"},
               token: "token",
               requester: requester
             )

    assert {:ok, %{}} =
             Asana.Workspaces.remove_user_openapi("w1", %{user: "u2"},
               token: "token",
               requester: requester
             )
  end

  test "attachments upload/get/list/delete wrappers support multipart upload" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})

      case {opts[:method], opts[:url], get_in(opts, [:params, :offset])} do
        {:post, "/attachments", _} ->
          fields = Map.new(opts[:form_multipart])
          assert fields[:parent] == "t1"
          assert fields[:file] == {"file-content", filename: "spec.txt"}

          {:ok, %{status: 200, body: %{"data" => %{"gid" => "a1", "name" => "spec.txt"}}}}

        {:get, "/attachments/a1", _} ->
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "a1", "name" => "spec.txt"}}}}

        {:delete, "/attachments/a1", _} ->
          {:ok, %{status: 200, body: %{"data" => %{}}}}

        {:get, "/attachments", nil} ->
          {:ok,
           %{
             status: 200,
             body: %{"data" => [%{"gid" => "a1"}], "next_page" => %{"offset" => "n1"}}
           }}

        {:get, "/attachments", "n1"} ->
          {:ok, %{status: 200, body: %{"data" => [%{"gid" => "a2"}], "next_page" => nil}}}
      end
    end

    assert {:ok, %{"gid" => "a1", "name" => "spec.txt"}} =
             Asana.Attachments.upload_openapi(
               %{parent: "t1", file: {"file-content", filename: "spec.txt"}},
               token: "token",
               requester: requester
             )

    assert_received {:request, upload_req}
    assert upload_req[:auth] == {:bearer, "token"}
    assert upload_req[:form_multipart]
    refute Keyword.has_key?(upload_req, :body)

    assert {:ok, %{"gid" => "a1", "name" => "spec.txt"}} =
             Asana.Attachments.get_openapi("a1", token: "token", requester: requester)

    assert [%{"gid" => "a1"}, %{"gid" => "a2"}] =
             Asana.Attachments.list_openapi("t1", token: "token", requester: requester)
             |> Enum.to_list()

    assert {:ok, %{}} =
             Asana.Attachments.delete_openapi("a1", token: "token", requester: requester)
  end
end
