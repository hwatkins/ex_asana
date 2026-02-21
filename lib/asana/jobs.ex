defmodule Asana.Jobs do
  @moduledoc """
  Job resource functions.
  """

  alias Asana.Error
  alias Asana.OpenAPI

  @generated_jobs_module :"Elixir.Asana.Generated.Jobs"
  @terminal_statuses ["succeeded", "failed", "cancelled"]

  @spec get_openapi(String.t(), keyword()) :: {:ok, map()} | {:error, Error.t()}
  def get_openapi(job_gid, opts \\ []) when is_binary(job_gid) and is_list(opts) do
    OpenAPI.call(@generated_jobs_module, :get_job, [job_gid], opts, :generated_jobs_not_available)
  end

  @spec wait_until_complete(String.t(), keyword()) :: {:ok, map()} | {:error, Error.t()}
  def wait_until_complete(job_gid, opts \\ []) when is_binary(job_gid) and is_list(opts) do
    max_attempts = Keyword.get(opts, :max_attempts, 60)
    interval_ms = Keyword.get(opts, :interval_ms, 1_000)
    sleep_fn = Keyword.get(opts, :sleep_fn, &Process.sleep/1)
    api_opts = Keyword.drop(opts, [:max_attempts, :interval_ms, :sleep_fn])

    wait(job_gid, api_opts, max_attempts, interval_ms, sleep_fn)
  end

  @spec wait_for_duplicate({:ok, map()} | map(), keyword()) :: {:ok, map()} | {:error, Error.t()}
  def wait_for_duplicate(result_or_job, opts \\ []) when is_list(opts) do
    case extract_job_gid(result_or_job) do
      {:ok, job_gid} ->
        wait_until_complete(job_gid, opts)

      :error ->
        {:error,
         %Error{
           status: nil,
           message: "invalid_job_reference",
           body: %{reason: :invalid_job_reference, reference: result_or_job}
         }}
    end
  end

  defp wait(_job_gid, _opts, 0, _interval_ms, _sleep_fn) do
    {:error, %Error{status: nil, message: "job_timeout", body: %{reason: :job_timeout}}}
  end

  defp wait(job_gid, opts, remaining, interval_ms, sleep_fn) do
    case get_openapi(job_gid, opts) do
      {:ok, job} ->
        case job_status(job) do
          "succeeded" ->
            {:ok, job}

          status when status in @terminal_statuses ->
            {:error,
             %Error{status: nil, message: "job_not_successful", body: %{job: job, status: status}}}

          _ ->
            sleep_fn.(interval_ms)
            wait(job_gid, opts, remaining - 1, interval_ms, sleep_fn)
        end

      {:error, %Error{} = error} ->
        {:error, error}
    end
  end

  defp job_status(%{"status" => status}) when is_binary(status), do: status
  defp job_status(%{status: status}) when is_binary(status), do: status
  defp job_status(_), do: nil

  defp extract_job_gid({:ok, job}), do: extract_job_gid(job)
  defp extract_job_gid(%{"gid" => gid}) when is_binary(gid), do: {:ok, gid}
  defp extract_job_gid(%{gid: gid}) when is_binary(gid), do: {:ok, gid}
  defp extract_job_gid(_), do: :error
end
