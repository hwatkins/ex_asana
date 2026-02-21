defmodule Asana.OrganizationExport do
  @moduledoc """
  Provides struct and type for a OrganizationExport
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t() | nil,
          download_url: String.t() | nil,
          gid: String.t() | nil,
          organization: Asana.Workspace.compact() | nil,
          resource_type: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [:__info__, :created_at, :download_url, :gid, :organization, :resource_type, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      created_at: {:string, "date-time"},
      download_url: {:string, "uri"},
      gid: :string,
      organization: {Asana.Workspace, :compact},
      resource_type: :string,
      state: {:enum, ["pending", "started", "finished", "error"]}
    ]
  end
end
