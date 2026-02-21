defmodule Asana.OperationClientTest do
  use ExUnit.Case, async: true

  alias Asana.OperationClient

  test "request/1 maps generated operation payload into Asana.Client request" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})
      {:ok, %{status: 200, body: %{"data" => [%{"gid" => "1"}], "next_page" => nil}}}
    end

    request = %{
      method: :get,
      url: "/tasks",
      query: [project: "project-1", opt_fields: nil],
      opts: [token: "token", requester: requester]
    }

    assert {:ok, %{"data" => [%{"gid" => "1"}], "next_page" => nil}} =
             OperationClient.request(request)

    assert_received {:request, opts}
    assert opts[:method] == :get
    assert opts[:url] == "/tasks"
    assert opts[:params] == %{project: "project-1"}
    assert opts[:auth] == {:bearer, "token"}
  end

  test "request/1 forwards body on mutating operations" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})
      {:ok, %{status: 200, body: %{"data" => %{"gid" => "1"}}}}
    end

    request = %{
      method: :post,
      url: "/tasks",
      body: %{name: "new task"},
      opts: [token: "token", requester: requester]
    }

    assert {:ok, %{"data" => %{"gid" => "1"}}} = OperationClient.request(request)

    assert_received {:request, opts}
    assert opts[:body] == %{name: "new task"}
  end

  test "request/1 sends JSON payloads using :json for application/json operations" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})
      {:ok, %{status: 201, body: %{"data" => %{"gid" => "p1"}}}}
    end

    request = %{
      method: :post,
      url: "/projects",
      body: %{data: %{name: "Smoke Project", workspace: "1202968847765699"}},
      request: [{"application/json", :map}],
      opts: [token: "token", requester: requester]
    }

    assert {:ok, %{"data" => %{"gid" => "p1"}}} = OperationClient.request(request)

    assert_received {:request, opts}
    assert opts[:json] == %{data: %{name: "Smoke Project", workspace: "1202968847765699"}}
    refute Keyword.has_key?(opts, :body)
  end

  test "request/1 uses multipart form encoding for multipart operation requests" do
    parent = self()

    requester = fn opts ->
      send(parent, {:request, opts})
      {:ok, %{status: 200, body: %{"data" => %{"gid" => "a1"}}}}
    end

    request = %{
      method: :post,
      url: "/attachments",
      body: %{parent: "t1", file: {"file-content", filename: "spec.txt"}},
      request: [{"multipart/form-data", {Asana.Generated.AttachmentRequest, :t}}],
      opts: [token: "token", requester: requester]
    }

    assert {:ok, %{"data" => %{"gid" => "a1"}}} = OperationClient.request(request)

    assert_received {:request, opts}
    assert opts[:form_multipart]
    assert Map.new(opts[:form_multipart])[:parent] == "t1"
    assert Map.new(opts[:form_multipart])[:file] == {"file-content", filename: "spec.txt"}
    refute Keyword.has_key?(opts, :body)
  end
end
