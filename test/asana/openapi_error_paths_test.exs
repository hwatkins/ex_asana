defmodule Asana.OpenAPIErrorPathsTest do
  use ExUnit.Case, async: true

  test "projects add_members_openapi/3 returns structured 429 error" do
    requester = fn _opts ->
      {:ok,
       %{
         status: 429,
         headers: [{"retry-after", "1"}],
         body: %{"errors" => [%{"message" => "Too many requests"}]}
       }}
    end

    assert {:error, %Asana.Error{status: 429, message: "Too many requests"}} =
             Asana.Projects.add_members_openapi("p1", %{members: ["u2"]},
               token: "token",
               requester: requester,
               max_retries: 0
             )
  end

  test "users update_for_workspace_openapi/4 returns structured 404 error" do
    requester = fn _opts ->
      {:ok, %{status: 404, body: %{"errors" => [%{"message" => "User not found"}]}}}
    end

    assert {:error, %Asana.Error{status: 404, message: "User not found"}} =
             Asana.Users.update_for_workspace_openapi("w1", "u-missing", %{name: "Nope"},
               token: "token",
               requester: requester
             )
  end

  test "workspaces add_user_openapi/3 returns structured 500 error" do
    requester = fn _opts ->
      {:ok, %{status: 500, body: %{"errors" => [%{"message" => "Internal error"}]}}}
    end

    assert {:error, %Asana.Error{status: 500, message: "Internal error"}} =
             Asana.Workspaces.add_user_openapi("w1", %{user: "u2"},
               token: "token",
               requester: requester
             )
  end

  test "workspaces remove_user_openapi/3 returns request_failed on transport failure" do
    requester = fn _opts ->
      {:error, :timeout}
    end

    assert {:error, %Asana.Error{status: nil, message: "request_failed", body: :timeout}} =
             Asana.Workspaces.remove_user_openapi("w1", %{user: "u2"},
               token: "token",
               requester: requester
             )
  end
end
