defmodule Asana.ClientTest do
  use ExUnit.Case, async: true

  alias Asana.Client

  describe "new/1" do
    test "uses application token when one is not explicitly provided" do
      Application.put_env(:ex_asana, :token, "config-token")
      on_exit(fn -> Application.delete_env(:ex_asana, :token) end)

      client = Client.new()

      assert client.token == "config-token"
    end
  end

  describe "request/2" do
    test "returns data from successful responses" do
      client =
        Client.new(
          token: "default-token",
          requester: fn opts ->
            assert opts[:auth] == {:bearer, "default-token"}
            {:ok, %{status: 200, body: %{"data" => %{"gid" => "123"}}}}
          end
        )

      assert {:ok, %{"gid" => "123"}} = Client.request(client, method: :get, url: "/tasks/123")
    end

    test "allows per-request token override" do
      client =
        Client.new(
          token: "default-token",
          requester: fn opts ->
            assert opts[:auth] == {:bearer, "override-token"}
            {:ok, %{status: 200, body: %{"data" => []}}}
          end
        )

      assert {:ok, []} =
               Client.request(client,
                 method: :get,
                 url: "/tasks",
                 token: "override-token"
               )
    end

    test "returns structured errors for non-2xx responses" do
      client =
        Client.new(
          token: "token",
          requester: fn _opts ->
            {:ok,
             %{
               status: 404,
               body: %{"errors" => [%{"message" => "Not Found", "help" => "example"}]}
             }}
          end
        )

      assert {:error, error} = Client.request(client, method: :get, url: "/tasks/missing")
      assert error.status == 404
      assert error.message == "Not Found"
      assert error.body == %{"errors" => [%{"message" => "Not Found", "help" => "example"}]}
    end

    test "retries on 429 using retry-after header" do
      parent = self()

      requester = fn _opts ->
        attempt = Process.get(:attempt, 0)
        Process.put(:attempt, attempt + 1)

        case attempt do
          0 -> {:ok, %{status: 429, headers: [{"retry-after", "1"}], body: %{"errors" => []}}}
          _ -> {:ok, %{status: 200, body: %{"data" => [%{"gid" => "1"}]}}}
        end
      end

      client =
        Client.new(
          token: "token",
          requester: requester,
          sleep_fn: fn ms -> send(parent, {:slept, ms}) end
        )

      assert {:ok, [%{"gid" => "1"}]} = Client.request(client, method: :get, url: "/tasks")
      assert_received {:slept, 1000}
    end

    test "retries on 429 when headers are maps (Req responses)" do
      parent = self()

      requester = fn _opts ->
        attempt = Process.get(:attempt_map_headers, 0)
        Process.put(:attempt_map_headers, attempt + 1)

        case attempt do
          0 ->
            {:ok, %{status: 429, headers: %{"retry-after" => ["2"]}, body: %{"errors" => []}}}

          _ ->
            {:ok, %{status: 200, body: %{"data" => [%{"gid" => "2"}]}}}
        end
      end

      client =
        Client.new(
          token: "token",
          requester: requester,
          sleep_fn: fn ms -> send(parent, {:slept, ms}) end
        )

      assert {:ok, [%{"gid" => "2"}]} = Client.request(client, method: :get, url: "/tasks")
      assert_received {:slept, 2000}
    end

    test "returns structured error when token is missing" do
      client =
        Client.new(
          token: nil,
          requester: fn _opts ->
            flunk("requester should not be called without a token")
          end
        )

      assert {:error, %Asana.Error{status: nil, message: "missing_token"}} =
               Client.request(client, method: :get, url: "/tasks")
    end
  end
end
