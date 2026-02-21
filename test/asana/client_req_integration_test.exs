defmodule Asana.ClientReqIntegrationTest do
  use ExUnit.Case, async: true

  alias Asana.Client

  test "request/2 uses Req path and decodes JSON body" do
    stub = {__MODULE__, make_ref()}

    Req.Test.stub(stub, fn conn ->
      assert conn.method == "GET"
      assert conn.request_path == "/api/1.0/tasks/1"
      assert conn.query_string == "workspace=w1"
      assert Enum.member?(conn.req_headers, {"authorization", "Bearer test-token"})

      Req.Test.json(conn, %{"data" => %{"gid" => "1"}})
    end)

    client = Client.new(token: "test-token")

    assert {:ok, %{"gid" => "1"}} =
             Client.request(client,
               method: :get,
               url: "/tasks/1",
               params: %{workspace: "w1"},
               plug: {Req.Test, stub}
             )
  end

  test "request/2 retries on 429 in Req path using Retry-After header" do
    parent = self()
    stub = {__MODULE__, make_ref()}

    Req.Test.expect(stub, fn conn ->
      conn
      |> Plug.Conn.put_status(429)
      |> Plug.Conn.put_resp_header("retry-after", "3")
      |> Req.Test.json(%{"errors" => [%{"message" => "Rate limit"}]})
    end)

    Req.Test.expect(stub, fn conn ->
      Req.Test.json(conn, %{"data" => [%{"gid" => "1"}]})
    end)

    client = Client.new(token: "test-token", sleep_fn: fn ms -> send(parent, {:slept, ms}) end)

    assert {:ok, [%{"gid" => "1"}]} =
             Client.request(client,
               method: :get,
               url: "/tasks",
               plug: {Req.Test, stub}
             )

    assert_received {:slept, 3000}
    Req.Test.verify!(stub)
  end
end
