defmodule Asana.DuplicatesAndJobsTest do
  use ExUnit.Case, async: true

  test "tasks reopen and duplicate wrappers" do
    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:put, "/tasks/t1"} ->
          assert opts[:json] == %{data: %{completed: false}}
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "t1", "completed" => false}}}}

        {:post, "/tasks/t1/duplicate"} ->
          assert opts[:json] == %{data: %{name: "Copy of Task"}}

          {:ok,
           %{
             status: 201,
             body: %{"data" => %{"gid" => "job-1", "resource_subtype" => "duplicate_task"}}
           }}
      end
    end

    assert {:ok, %Asana.Task{gid: "t1", completed: false}} =
             Asana.Tasks.reopen_openapi("t1", token: "token", requester: requester)

    assert {:ok, %{"gid" => "job-1", "resource_subtype" => "duplicate_task"}} =
             Asana.Tasks.duplicate_openapi("t1", %{name: "Copy of Task"},
               token: "token",
               requester: requester
             )
  end

  test "tasks duplicate_and_wait_openapi/3 duplicates then polls job" do
    parent = self()

    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:post, "/tasks/t2/duplicate"} ->
          assert opts[:json] == %{data: %{name: "Copy Task 2"}}
          {:ok, %{status: 201, body: %{"data" => %{"gid" => "job-task-2"}}}}

        {:get, "/jobs/job-task-2"} ->
          attempt = Process.get(:dup_task_attempt, 0)
          Process.put(:dup_task_attempt, attempt + 1)
          status = if attempt < 1, do: "in_progress", else: "succeeded"
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "job-task-2", "status" => status}}}}
      end
    end

    assert {:ok, %{"gid" => "job-task-2", "status" => "succeeded"}} =
             Asana.Tasks.duplicate_and_wait_openapi("t2", %{name: "Copy Task 2"},
               token: "token",
               requester: requester,
               max_attempts: 3,
               interval_ms: 5,
               sleep_fn: fn ms -> send(parent, {:slept, ms}) end
             )

    assert_received {:slept, 5}
  end

  test "projects duplicate wrapper" do
    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:post, "/projects/p1/duplicate"} ->
          assert opts[:json] == %{data: %{name: "Copy of Project"}}

          {:ok,
           %{
             status: 201,
             body: %{"data" => %{"gid" => "job-2", "resource_subtype" => "duplicate_project"}}
           }}
      end
    end

    assert {:ok, %{"gid" => "job-2", "resource_subtype" => "duplicate_project"}} =
             Asana.Projects.duplicate_openapi("p1", %{name: "Copy of Project"},
               token: "token",
               requester: requester
             )
  end

  test "projects duplicate_and_wait_openapi/3 duplicates then polls job" do
    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:post, "/projects/p2/duplicate"} ->
          assert opts[:json] == %{data: %{name: "Copy Project 2"}}
          {:ok, %{status: 201, body: %{"data" => %{"gid" => "job-project-2"}}}}

        {:get, "/jobs/job-project-2"} ->
          {:ok,
           %{status: 200, body: %{"data" => %{"gid" => "job-project-2", "status" => "succeeded"}}}}
      end
    end

    assert {:ok, %{"gid" => "job-project-2", "status" => "succeeded"}} =
             Asana.Projects.duplicate_and_wait_openapi("p2", %{name: "Copy Project 2"},
               token: "token",
               requester: requester,
               max_attempts: 1,
               interval_ms: 1,
               sleep_fn: fn _ -> :ok end
             )
  end

  test "jobs get_openapi and wait_until_complete" do
    parent = self()

    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:get, "/jobs/job-3"} ->
          attempt = Process.get(:job_attempt, 0)
          Process.put(:job_attempt, attempt + 1)

          status = if attempt < 2, do: "in_progress", else: "succeeded"

          {:ok,
           %{
             status: 200,
             body: %{"data" => %{"gid" => "job-3", "status" => status}}
           }}
      end
    end

    assert {:ok, %{"gid" => "job-3", "status" => "in_progress"}} =
             Asana.Jobs.get_openapi("job-3", token: "token", requester: requester)

    assert {:ok, %{"gid" => "job-3", "status" => "succeeded"}} =
             Asana.Jobs.wait_until_complete("job-3",
               token: "token",
               requester: requester,
               max_attempts: 5,
               sleep_fn: fn ms -> send(parent, {:slept, ms}) end,
               interval_ms: 10
             )

    assert_received {:slept, 10}
  end

  test "jobs wait_until_complete returns timeout error when attempts exhausted" do
    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:get, "/jobs/job-timeout"} ->
          {:ok,
           %{status: 200, body: %{"data" => %{"gid" => "job-timeout", "status" => "in_progress"}}}}
      end
    end

    assert {:error, %Asana.Error{message: "job_timeout"}} =
             Asana.Jobs.wait_until_complete("job-timeout",
               token: "token",
               requester: requester,
               max_attempts: 2,
               sleep_fn: fn _ -> :ok end,
               interval_ms: 1
             )
  end

  test "jobs wait_until_complete returns not_successful for terminal failed status" do
    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:get, "/jobs/job-failed"} ->
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "job-failed", "status" => "failed"}}}}
      end
    end

    assert {:error, %Asana.Error{message: "job_not_successful", body: %{status: "failed"}}} =
             Asana.Jobs.wait_until_complete("job-failed",
               token: "token",
               requester: requester,
               max_attempts: 1,
               sleep_fn: fn _ -> :ok end,
               interval_ms: 1
             )
  end

  test "jobs wait_for_duplicate accepts duplicate result tuple" do
    requester = fn opts ->
      case {opts[:method], opts[:url]} do
        {:get, "/jobs/job-dup"} ->
          {:ok, %{status: 200, body: %{"data" => %{"gid" => "job-dup", "status" => "succeeded"}}}}
      end
    end

    duplicate_result = {:ok, %{"gid" => "job-dup", "resource_subtype" => "duplicate_task"}}

    assert {:ok, %{"gid" => "job-dup", "status" => "succeeded"}} =
             Asana.Jobs.wait_for_duplicate(duplicate_result,
               token: "token",
               requester: requester,
               max_attempts: 1,
               sleep_fn: fn _ -> :ok end,
               interval_ms: 1
             )
  end

  test "jobs wait_for_duplicate returns invalid_job_reference when gid is missing" do
    assert {:error, %Asana.Error{message: "invalid_job_reference"}} =
             Asana.Jobs.wait_for_duplicate({:ok, %{"resource_subtype" => "duplicate_task"}}, [])
  end
end
