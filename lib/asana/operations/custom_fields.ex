defmodule Asana.CustomFields do
  @moduledoc """
  Provides API endpoints related to custom fields
  """

  @default_client Asana.Client

  @type create_custom_field_201_json_resp :: %{
          __info__: map,
          data: Asana.CustomField.response() | nil
        }

  @doc """
  Create a custom field

  <b>Required scope: </b><code>custom_fields:write</code>

  Creates a new custom field in a workspace. Every custom field is required
  to be created in a specific workspace, and this workspace cannot be
  changed once set.

  A custom field’s name must be unique within a workspace and not conflict
  with names of existing task properties such as `Due Date` or `Assignee`.
  A custom field’s type must be one of `text`, `enum`, `multi_enum`, `number`,
  `date`, or `people`.

  Returns the full record of the newly created custom field.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The custom field object to create.
  """
  @spec create_custom_field(body :: map, opts :: keyword) ::
          {:ok, Asana.CustomFields.create_custom_field_201_json_resp()}
          | {:error, Asana.Error.t()}
  def create_custom_field(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.CustomFields, :create_custom_field},
      url: "/custom_fields",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.CustomFields, :create_custom_field_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type create_enum_option_for_custom_field_201_json_resp :: %{
          __info__: map,
          data: Asana.EnumOption.t() | nil
        }

  @doc """
  Create an enum option

  <b>Required scope: </b><code>custom_fields:write</code>

  Creates an enum option and adds it to this custom field’s list of enum options. A custom field can have at most 500 enum options (including disabled options). By default new enum options are inserted at the end of a custom field’s list.
  Locked custom fields can only have enum options added by the user who locked the field.
  Returns the full record of the newly created enum option.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The enum option object to create.
  """
  @spec create_enum_option_for_custom_field(
          custom_field_gid :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Asana.CustomFields.create_enum_option_for_custom_field_201_json_resp()}
          | {:error, Asana.Error.t()}
  def create_enum_option_for_custom_field(custom_field_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [custom_field_gid: custom_field_gid, body: body],
      call: {Asana.CustomFields, :create_enum_option_for_custom_field},
      url: "/custom_fields/#{custom_field_gid}/enum_options",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Asana.CustomFields, :create_enum_option_for_custom_field_201_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type delete_custom_field_200_json_resp :: %{__info__: map, data: map | nil}

  @doc """
  Delete a custom field

  A specific, existing custom field can be deleted by making a DELETE request on the URL for that custom field.
  Locked custom fields can only be deleted by the user who locked the field.
  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_custom_field(custom_field_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.CustomFields.delete_custom_field_200_json_resp()}
          | {:error, Asana.Error.t()}
  def delete_custom_field(custom_field_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [custom_field_gid: custom_field_gid],
      call: {Asana.CustomFields, :delete_custom_field},
      url: "/custom_fields/#{custom_field_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.CustomFields, :delete_custom_field_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_custom_field_200_json_resp :: %{
          __info__: map,
          data: Asana.CustomField.response() | nil
        }

  @doc """
  Get a custom field

  <b>Required scope: </b><code>custom_fields:read</code>

  Get the complete definition of a custom field’s metadata.

  Since custom fields can be defined for one of a number of types, and
  these types have different data and behaviors, there are fields that are
  relevant to a particular type. For instance, as noted above, enum_options
  is only relevant for the enum type and defines the set of choices that
  the enum could represent. The examples below show some of these
  type-specific custom field definitions.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_custom_field(custom_field_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.CustomFields.get_custom_field_200_json_resp()} | {:error, Asana.Error.t()}
  def get_custom_field(custom_field_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [custom_field_gid: custom_field_gid],
      call: {Asana.CustomFields, :get_custom_field},
      url: "/custom_fields/#{custom_field_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.CustomFields, :get_custom_field_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type get_custom_fields_for_workspace_200_json_resp :: %{
          __info__: map,
          data: [Asana.CustomField.response()] | nil,
          next_page: Asana.NextPage.t() | nil
        }

  @doc """
  Get a workspace's custom fields

  <b>Required scope: </b><code>custom_fields:read</code>

  Returns a list of the compact representation of all of the custom fields in a workspace.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_custom_fields_for_workspace(workspace_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.CustomFields.get_custom_fields_for_workspace_200_json_resp()}
          | {:error, Asana.Error.t()}
  def get_custom_fields_for_workspace(workspace_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty])

    client.request(%{
      args: [workspace_gid: workspace_gid],
      call: {Asana.CustomFields, :get_custom_fields_for_workspace},
      url: "/workspaces/#{workspace_gid}/custom_fields",
      method: :get,
      query: query,
      response: [
        {200, {Asana.CustomFields, :get_custom_fields_for_workspace_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type insert_enum_option_for_custom_field_200_json_resp :: %{
          __info__: map,
          data: Asana.EnumOption.t() | nil
        }

  @doc """
  Reorder a custom field's enum

  <b>Required scope: </b><code>custom_fields:write</code>

  Moves a particular enum option to be either before or after another specified enum option in the custom field.
  Locked custom fields can only be reordered by the user who locked the field.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The enum option object to create.
  """
  @spec insert_enum_option_for_custom_field(
          custom_field_gid :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Asana.CustomFields.insert_enum_option_for_custom_field_200_json_resp()}
          | {:error, Asana.Error.t()}
  def insert_enum_option_for_custom_field(custom_field_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [custom_field_gid: custom_field_gid, body: body],
      call: {Asana.CustomFields, :insert_enum_option_for_custom_field},
      url: "/custom_fields/#{custom_field_gid}/enum_options/insert",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.CustomFields, :insert_enum_option_for_custom_field_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_custom_field_200_json_resp :: %{
          __info__: map,
          data: Asana.CustomField.response() | nil
        }

  @doc """
  Update a custom field

  <b>Required scope: </b><code>custom_fields:write</code>

  A specific, existing custom field can be updated by making a PUT request on the URL for that custom field. Only the fields provided in the `data` block will be updated; any unspecified fields will remain unchanged
  When using this method, it is best to specify only those fields you wish to change, or else you may overwrite changes made by another user since you last retrieved the custom field.
  A custom field’s `type` cannot be updated.
  An enum custom field’s `enum_options` cannot be updated with this endpoint. Instead see “Work With Enum Options” for information on how to update `enum_options`.
  Locked custom fields can only be updated by the user who locked the field.
  Returns the complete updated custom field record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The custom field object with all updated properties.
  """
  @spec update_custom_field(custom_field_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.CustomFields.update_custom_field_200_json_resp()}
          | {:error, Asana.Error.t()}
  def update_custom_field(custom_field_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [custom_field_gid: custom_field_gid, body: body],
      call: {Asana.CustomFields, :update_custom_field},
      url: "/custom_fields/#{custom_field_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.CustomFields, :update_custom_field_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @type update_enum_option_200_json_resp :: %{__info__: map, data: Asana.EnumOption.t() | nil}

  @doc """
  Update an enum option

  <b>Required scope: </b><code>custom_fields:write</code>

  Updates an existing enum option. Enum custom fields require at least one enabled enum option.
  Locked custom fields can only be updated by the user who locked the field.
  Returns the full record of the updated enum option.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `application/json`

  The enum option object to update
  """
  @spec update_enum_option(enum_option_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.CustomFields.update_enum_option_200_json_resp()} | {:error, Asana.Error.t()}
  def update_enum_option(enum_option_gid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [enum_option_gid: enum_option_gid, body: body],
      call: {Asana.CustomFields, :update_enum_option},
      url: "/enum_options/#{enum_option_gid}",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.CustomFields, :update_enum_option_200_json_resp}},
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
  def __fields__(:create_custom_field_201_json_resp) do
    [data: {Asana.CustomField, :response}]
  end

  def __fields__(:create_enum_option_for_custom_field_201_json_resp) do
    [data: {Asana.EnumOption, :t}]
  end

  def __fields__(:delete_custom_field_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_custom_field_200_json_resp) do
    [data: {Asana.CustomField, :response}]
  end

  def __fields__(:get_custom_fields_for_workspace_200_json_resp) do
    [data: [{Asana.CustomField, :response}], next_page: {Asana.NextPage, :t}]
  end

  def __fields__(:insert_enum_option_for_custom_field_200_json_resp) do
    [data: {Asana.EnumOption, :t}]
  end

  def __fields__(:update_custom_field_200_json_resp) do
    [data: {Asana.CustomField, :response}]
  end

  def __fields__(:update_enum_option_200_json_resp) do
    [data: {Asana.EnumOption, :t}]
  end
end
