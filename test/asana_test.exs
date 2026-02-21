defmodule AsanaTest do
  use ExUnit.Case, async: true

  test "client/1 builds an Asana.Client struct" do
    client = Asana.client(token: "token")

    assert %Asana.Client{} = client
    assert client.token == "token"
  end

  test "request/2 delegates to Asana.Client.request/2" do
    client =
      Asana.client(
        token: "token",
        requester: fn opts ->
          assert opts[:url] == "/projects"
          {:ok, %{status: 200, body: %{"data" => []}}}
        end
      )

    assert {:ok, []} = Asana.request(client, method: :get, url: "/projects")
  end
end
