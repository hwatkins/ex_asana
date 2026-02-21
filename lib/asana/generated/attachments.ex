defmodule Asana.Generated.Attachments do
  @moduledoc """
  Provides API endpoints related to attachments
  """

  @default_client Asana.OperationClient

  @type create_attachment_for_object_200_json_resp :: %{
          data: Asana.Generated.AttachmentResponse.t() | nil
        }

  @doc """
  Upload an attachment

  <b>Required scope: </b><code>attachments:write</code>

  Upload an attachment.

  This method uploads an attachment on an object and returns the compact
  record for the created attachment object. This is possible by either:

  - Providing the URL of the external resource being attached, or
  - Downloading the file content first and then uploading it as any other attachment. Note that it is not possible to attach
  files from third party services such as Dropbox, Box, Vimeo & Google Drive via the API

  The 100MB size limit on attachments in Asana is enforced on this endpoint.

  This endpoint expects a multipart/form-data encoded request containing the full contents of the file to be uploaded.

  Requests made should follow the HTTP/1.1 specification that line
  terminators are of the form `CRLF` or `\r\n` outlined
  [here](http://www.w3.org/Protocols/HTTP/1.1/draft-ietf-http-v11-spec-01#Basic-Rules) in order for the server to reliably and properly handle the request.

  For file names that contain non-ASCII characters, the file name should be URL-encoded. For example, a file named `résumé.pdf` should be encoded as
  `r%C3%A9sum%C3%A9.pdf` and the `filename` parameter in the `Content-Disposition` header should be set to the encoded file name.

  Below is an example of a cURL request with the `Content-Disposition` header:

  ```
  export ASANA_PAT="<YOUR_ASANA_PERSONAL_ACCESS_TOKEN>"
  export PARENT_ID="<PARENT_GID>"
  export ENCODED_NAME="r%C3%A9sum%C3%A9.pdf"
  curl --location 'https://app.asana.com/api/1.0/attachments' \
    --header 'Content-Type: multipart/form-data' \
    --header 'Accept: application/json' \
    --header "Authorization: Bearer $ASANA_PAT" \
    --form "parent=$PARENT_ID" \
    --form "file=@/Users/exampleUser/Downloads/résumé.pdf;headers=\"Content-Disposition: form-data; name="file"; filename="$ENCODED_NAME.pdf"; filename*=UTF-8''$ENCODED_NAME.pdf\""
  ```

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  ## Request Body

  **Content Types**: `multipart/form-data`

  The file you want to upload.

  *Note when using curl:*

  Be sure to add an `‘@’` before the file path, and use the `--form`
  option instead of the `-d` option.

  When uploading PDFs with curl, force the content-type to be pdf by
  appending the content type to the file path: `--form
  "file=@file.pdf;type=application/pdf"`.
  """
  @spec create_attachment_for_object(
          body :: Asana.Generated.AttachmentRequest.t(),
          opts :: keyword
        ) ::
          {:ok, Asana.Generated.Attachments.create_attachment_for_object_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def create_attachment_for_object(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [body: body],
      call: {Asana.Generated.Attachments, :create_attachment_for_object},
      url: "/attachments",
      body: body,
      method: :post,
      query: query,
      request: [{"multipart/form-data", {Asana.Generated.AttachmentRequest, :t}}],
      response: [
        {200, {Asana.Generated.Attachments, :create_attachment_for_object_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type delete_attachment_200_json_resp :: %{data: map | nil}

  @doc """
  Delete an attachment

  <b>Required scope: </b><code>attachments:delete</code>

  Deletes a specific, existing attachment.

  Returns an empty data record.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.

  """
  @spec delete_attachment(attachment_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Attachments.delete_attachment_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def delete_attachment(attachment_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_pretty])

    client.request(%{
      args: [attachment_gid: attachment_gid],
      call: {Asana.Generated.Attachments, :delete_attachment},
      url: "/attachments/#{attachment_gid}",
      method: :delete,
      query: query,
      response: [
        {200, {Asana.Generated.Attachments, :delete_attachment_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_attachment_200_json_resp :: %{data: Asana.Generated.AttachmentResponse.t() | nil}

  @doc """
  Get an attachment

  <b>Required scope: </b><code>attachments:read</code>

  Get the full record for a single attachment.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_attachment(attachment_gid :: String.t(), opts :: keyword) ::
          {:ok, Asana.Generated.Attachments.get_attachment_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_attachment(attachment_gid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:opt_fields, :opt_pretty])

    client.request(%{
      args: [attachment_gid: attachment_gid],
      call: {Asana.Generated.Attachments, :get_attachment},
      url: "/attachments/#{attachment_gid}",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Attachments, :get_attachment_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {402, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {424, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}},
        {501, {Asana.Generated.ErrorResponse, :t}},
        {503, {Asana.Generated.ErrorResponse, :t}},
        {504, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type get_attachments_for_object_200_json_resp :: %{
          data: [Asana.Generated.AttachmentCompact.t()] | nil,
          next_page: Asana.Generated.NextPage.t() | nil
        }

  @doc """
  Get attachments from an object

  <b>Required scope: </b><code>attachments:read</code>

  Returns the compact records for all attachments on the object.
  There are three possible `parent` values for this request: `project`, `project_brief`, and `task`. For a project, an attachment refers to a file uploaded to the "Key resources" section in the project Overview. For a project brief, an attachment refers to inline files in the project brief itself. For a task, an attachment refers to a file directly associated to that task.

  Note that within the Asana app, inline images in the task description do not appear in the index of image thumbnails nor as stories in the task. However, requests made to `GET /attachments` for a task will return all of the images in the task, including inline images.

  ## Options

    * `opt_pretty`: Provides “pretty” output.
      Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    * `limit`: Results per page.
      The number of objects to return per page. The value must be between 1 and 100.
    * `offset`: Offset token.
      An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results.
      *Note: You can only pass in an offset that was returned to you via a previously paginated request.*
    * `parent`: Globally unique identifier for object to fetch statuses from. Must be a GID for a `project`, `project_brief`, or `task`.
    * `opt_fields`: This endpoint returns a resource which excludes some properties by default. To include those optional properties, set this query parameter to a comma-separated list of the properties you wish to include.

  """
  @spec get_attachments_for_object(opts :: keyword) ::
          {:ok, Asana.Generated.Attachments.get_attachments_for_object_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def get_attachments_for_object(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :opt_fields, :opt_pretty, :parent])

    client.request(%{
      args: [],
      call: {Asana.Generated.Attachments, :get_attachments_for_object},
      url: "/attachments",
      method: :get,
      query: query,
      response: [
        {200, {Asana.Generated.Attachments, :get_attachments_for_object_200_json_resp}},
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
  def __fields__(:create_attachment_for_object_200_json_resp) do
    [data: {Asana.Generated.AttachmentResponse, :t}]
  end

  def __fields__(:delete_attachment_200_json_resp) do
    [data: :map]
  end

  def __fields__(:get_attachment_200_json_resp) do
    [data: {Asana.Generated.AttachmentResponse, :t}]
  end

  def __fields__(:get_attachments_for_object_200_json_resp) do
    [data: [{Asana.Generated.AttachmentCompact, :t}], next_page: {Asana.Generated.NextPage, :t}]
  end
end
