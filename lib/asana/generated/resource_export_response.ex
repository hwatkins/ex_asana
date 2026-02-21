defmodule Asana.Generated.ResourceExportResponse do
  @moduledoc """
  Provides struct and type for a ResourceExportResponse
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          new_resource_export: Asana.Generated.ResourceExportCompact.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [:gid, :new_resource_export, :resource_subtype, :resource_type, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      new_resource_export: {Asana.Generated.ResourceExportCompact, :t},
      resource_subtype: :string,
      resource_type: :string,
      status: {:enum, ["not_started", "in_progress", "succeeded", "failed"]}
    ]
  end
end
