defmodule Mix.Tasks.Asana.RefreshSpec do
  @moduledoc """
  Downloads the latest Asana OpenAPI spec, regenerates code, and runs CI checks.

  By default this task:

  1. Downloads the spec from Asana's public OpenAPI repository.
  2. Writes it to `priv/openapi/asana.yaml`.
  3. Runs `mix api.gen.asana`.
  4. Runs `mix ci.fast`.
  """

  use Mix.Task

  @default_source_url "https://raw.githubusercontent.com/Asana/openapi/master/defs/asana_oas.yaml"
  @default_output "priv/openapi/asana.yaml"
  @default_ci_task "ci.fast"

  @impl Mix.Task
  def run(args), do: run_with(args, [])

  @doc false
  def run_with(args, overrides) when is_list(args) and is_list(overrides) do
    {opts, _rest, _invalid} =
      OptionParser.parse(args,
        strict: [source_url: :string, output: :string, ci_task: :string, no_ci: :boolean],
        aliases: [u: :source_url, o: :output]
      )

    source_url = Keyword.get(opts, :source_url, @default_source_url)
    output = Keyword.get(opts, :output, @default_output)
    ci_task = Keyword.get(opts, :ci_task, @default_ci_task)
    run_ci? = not Keyword.get(opts, :no_ci, false)

    fetcher = Keyword.get(overrides, :fetcher, &default_fetcher/1)
    writer = Keyword.get(overrides, :writer, &default_writer/2)
    task_runner = Keyword.get(overrides, :task_runner, &Mix.Task.run/2)
    info = Keyword.get(overrides, :info, &Mix.shell().info/1)
    on_error = Keyword.get(overrides, :on_error, &Mix.raise/1)

    info.("Downloading Asana OpenAPI spec from #{source_url}...")

    with {:ok, body} <- fetcher.(source_url),
         :ok <- writer.(output, body) do
      info.("Wrote spec to #{output}")
      info.("Regenerating OpenAPI modules via mix api.gen.asana...")
      run_task(task_runner, "api.gen.asana", [])

      if run_ci? do
        info.("Running mix #{ci_task}...")
        run_task(task_runner, ci_task, [])
      else
        info.("Skipping CI checks (--no-ci)")
      end
    else
      {:error, message} ->
        on_error.(message)
    end
  end

  defp default_fetcher(url) do
    case Req.get(url: url, retry: false) do
      {:ok, %Req.Response{status: status, body: body}}
      when status in 200..299 and is_binary(body) ->
        {:ok, body}

      {:ok, %Req.Response{status: status}} ->
        {:error, "Failed to download spec (HTTP #{status}) from #{url}"}

      {:error, reason} ->
        {:error, "Failed to download spec from #{url}: #{inspect(reason)}"}
    end
  end

  defp default_writer(path, body) do
    with :ok <- File.mkdir_p(Path.dirname(path)),
         :ok <- File.write(path, body) do
      :ok
    else
      {:error, reason} ->
        {:error, "Failed to write spec to #{path}: #{inspect(reason)}"}
    end
  end

  defp run_task(task_runner, task, args) do
    task_runner.(task, args)
    :ok
  end
end
