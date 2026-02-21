defmodule Asana.OrganizationExports do
  @moduledoc """
  Provides API endpoints related to organization exports
  """

  @default_client Asana.Client

  @type create_organization_export_201_json_resp :: %{
          __info__: map,
          data: Asana.OrganizationExport.response() | nil
        }

  @doc """
  Create an organization export request

  This method creates a request to export an Organization. Asana will complete the export at some point after you create the request.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The organization to export.
  """
  @spec create_organization_export(body :: map, opts :: keyword) ::
          {:ok, Asana.OrganizationExports.create_organization_export_201_json_resp()}
          | {:error, Asana.Error.t()}
  def create_organization_export(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.OrganizationExports, :create_organization_export},
      url: "/organization_exports",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.OrganizationExports, :create_organization_export_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_organization_export_200_json_resp :: %{
          __info__: map,
          data: Asana.OrganizationExport.response() | nil
        }

  @doc """
  Get details on an org export request

  Returns details of a previously-requested Organization export.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_organization_export(organization_export_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.OrganizationExports.get_organization_export_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_organization_export(organization_export_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [organization_export_gid: organization_export_gid],
      call: {Asana.OrganizationExports, :get_organization_export},
      url: "/organization_exports/#{organization_export_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.OrganizationExports, :get_organization_export_200_json_resp}},
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
  def __fields__(:create_organization_export_201_json_resp) do
    [data: {Asana.OrganizationExport, :response}]
  end

  def __fields__(:get_organization_export_200_json_resp) do
    [data: {Asana.OrganizationExport, :response}]
  end
end
