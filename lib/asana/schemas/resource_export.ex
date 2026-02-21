defmodule Asana.ResourceExport do
  @moduledoc """
  Provides struct and types for a ResourceExport
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          completed_at: DateTime.t() | nil,
          created_at: DateTime.t() | nil,
          download_url: String.t() | nil,
          gid: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          new_resource_export: Asana.ResourceExport.compact() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :__info__,
    :completed_at,
    :created_at,
    :download_url,
    :gid,
    :new_resource_export,
    :resource_subtype,
    :resource_type,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      completed_at: {:string, "date-time"},
      created_at: {:string, "date-time"},
      download_url: {:string, "uri"},
      gid: :string,
      resource_type: :string
    ]
  end

  def __fields__(:response) do
    [
      gid: :string,
      new_resource_export: {Asana.ResourceExport, :compact},
      resource_subtype: :string,
      resource_type: :string,
      status: {:enum, ["not_started", "in_progress", "succeeded", "failed"]}
    ]
  end
end
