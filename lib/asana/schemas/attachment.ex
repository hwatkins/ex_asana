defmodule Asana.Attachment do
  @moduledoc """
  Provides struct and types for a Attachment
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          connected_to_app: boolean | nil,
          created_at: DateTime.t() | nil,
          download_url: String.t() | nil,
          gid: String.t() | nil,
          host: String.t() | nil,
          name: String.t() | nil,
          parent: Asana.Attachment.Parent.response() | nil,
          permanent_url: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          size: integer | nil,
          view_url: String.t() | nil
        }

  defstruct [
    :__info__,
    :connected_to_app,
    :created_at,
    :download_url,
    :gid,
    :host,
    :name,
    :parent,
    :permanent_url,
    :resource_subtype,
    :resource_type,
    :size,
    :view_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_subtype: :string, resource_type: :string]
  end

  def __fields__(:response) do
    [
      connected_to_app: :boolean,
      created_at: {:string, "date-time"},
      download_url: {:string, "uri"},
      gid: :string,
      host: :string,
      name: :string,
      parent: {Asana.Attachment.Parent, :response},
      permanent_url: {:string, "uri"},
      resource_subtype: :string,
      resource_type: :string,
      size: :integer,
      view_url: {:string, "uri"}
    ]
  end
end
