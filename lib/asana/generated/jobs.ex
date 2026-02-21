defmodule Asana.Generated.Jobs do
  @moduledoc """
  Provides API endpoint related to jobs
  """

  @default_client Asana.OperationClient

  @type get_job_200_json_resp :: %{data: Asana.Generated.JobResponse.t() | nil}

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
          {:ok, Asana.Generated.Jobs.get_job_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_job(job_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [job_gid: job_gid],
      call: {Asana.Generated.Jobs, :get_job},
      url: "/jobs/#{job_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Jobs, :get_job_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_job_200_json_resp) do
    [data: {Asana.Generated.JobResponse, :t}]
  end
end
