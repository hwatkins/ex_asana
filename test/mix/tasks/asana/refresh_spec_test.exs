defmodule Mix.Tasks.Asana.RefreshSpecTest do
  use ExUnit.Case, async: true

  alias Mix.Tasks.Asana.RefreshSpec

  test "run_with/2 downloads, writes, regenerates, and runs ci.fast by default" do
    parent = self()

    fetcher = fn url ->
      send(parent, {:fetch, url})
      {:ok, "spec-body"}
    end

    writer = fn path, body ->
      send(parent, {:write, path, body})
      :ok
    end

    task_runner = fn task, args ->
      send(parent, {:task, task, args})
      :ok
    end

    info = fn msg ->
      send(parent, {:info, msg})
      :ok
    end

    assert :ok =
             RefreshSpec.run_with([],
               fetcher: fetcher,
               writer: writer,
               task_runner: task_runner,
               info: info
             )

    assert_receive {:fetch,
                    "https://raw.githubusercontent.com/Asana/openapi/master/defs/asana_oas.yaml"}

    assert_receive {:write, "priv/openapi/asana.yaml", "spec-body"}
    assert_receive {:task, "api.gen.asana", []}
    assert_receive {:task, "ci.fast", []}
  end

  test "run_with/2 supports custom source/output and can skip ci" do
    parent = self()

    fetcher = fn url ->
      send(parent, {:fetch, url})
      {:ok, "spec-body"}
    end

    writer = fn path, body ->
      send(parent, {:write, path, body})
      :ok
    end

    task_runner = fn task, args ->
      send(parent, {:task, task, args})
      :ok
    end

    assert :ok =
             RefreshSpec.run_with(
               [
                 "--source-url",
                 "https://example.com/asana.yaml",
                 "--output",
                 "tmp/asana.yaml",
                 "--no-ci"
               ],
               fetcher: fetcher,
               writer: writer,
               task_runner: task_runner,
               info: fn _ -> :ok end
             )

    assert_receive {:fetch, "https://example.com/asana.yaml"}
    assert_receive {:write, "tmp/asana.yaml", "spec-body"}
    assert_receive {:task, "api.gen.asana", []}
    refute_received {:task, "ci.fast", []}
    refute_received {:task, "ci", []}
  end

  test "run_with/2 raises via on_error when download fails" do
    fetcher = fn _url -> {:error, "boom"} end

    assert_raise RuntimeError, "boom", fn ->
      RefreshSpec.run_with([],
        fetcher: fetcher,
        info: fn _ -> :ok end,
        on_error: fn msg -> raise RuntimeError, msg end
      )
    end
  end
end
