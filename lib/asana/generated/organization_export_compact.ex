defmodule Asana.Generated.OrganizationExportCompact do
  @moduledoc """
  Provides struct and type for a OrganizationExportCompact
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          download_url: String.t() | nil,
          gid: String.t() | nil,
          organization: Asana.Generated.WorkspaceCompact.t() | nil,
          resource_type: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [:created_at, :download_url, :gid, :organization, :resource_type, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      download_url: {:string, "uri"},
      gid: :string,
      organization: {Asana.Generated.WorkspaceCompact, :t},
      resource_type: :string,
      state: {:enum, ["pending", "started", "finished", "error"]}
    ]
  end
end
