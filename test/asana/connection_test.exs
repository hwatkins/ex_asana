defmodule Asana.ConnectionTest do
  use ExUnit.Case, async: true

  alias Asana.Connection

  test "new/1 builds a bearer-authenticated Req client" do
    request = Connection.new("token")

    assert %Req.Request{} = request
    assert request.options.base_url == "https://app.asana.com/api/1.0"
    assert request.options.auth == {:bearer, "token"}
    assert request.headers["user-agent"] == ["elixir-asana"]
  end

  test "new/0 builds an unauthenticated Req client" do
    request = Connection.new()

    assert %Req.Request{} = request
    assert request.options.base_url == "https://app.asana.com/api/1.0"
    refute Map.has_key?(request.options, :auth)
  end

  test "request/2 executes Req options built by api modules" do
    Req.Test.stub(:asana_stub, fn conn ->
      Req.Test.json(conn, %{
        method: conn.method,
        request_path: conn.request_path,
        query: conn.query_string
      })
    end)

    connection =
      Connection.new("token")
      |> Req.merge(plug: {Req.Test, :asana_stub})

    assert {:ok, %Req.Response{status: 200, body: body}} =
             Connection.request(
               connection,
               method: :get,
               url: "/tasks",
               query: [limit: 10]
             )

    assert body["method"] == "GET"
    assert body["request_path"] == "/api/1.0/tasks"
    assert body["query"] == "limit=10"
  end
end
