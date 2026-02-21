defmodule Asana.Jobs do
  @moduledoc """
  Provides API endpoint related to jobs
  """

  @default_client Asana.Client

  @type get_job_200_json_resp :: %{__info__: map, data: Asana.Job.response() | nil}

  @doc """
  Get a job by id

  <b>Required scope: </b><code>jobs:read</code>

  <table>
    <tr>
      <th>Field</th>
      <th>Required Scope</th>
    </tr>
    <tr>
      <td><code>new_task_template</code></td>
      <td><code>task_templates:read</code></td>
    </tr>
    <tr>
      <td><code>new_project</code></td>
      <td><code>projects:read</code></td>
    </tr>
    <tr>
      <td><code>new_task</code></td>
      <td><code>tasks:read</code></td>
    </tr>
    <tr>
      <td><code>new_project_template</code></td>
      <td><code>project_templates:read</code></td>
    </tr>
  </table>

  Returns the full record for a job.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_job(job_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Jobs.get_job_200_json_resp()} | {:error, Asana.Error.t()}
  def get_job(job_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [job_gid: job_gid],
      call: {Asana.Jobs, :get_job},
      url: "/jobs/#{job_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Jobs, :get_job_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_job_200_json_resp) do
    [data: {Asana.Job, :response}]
  end
end
