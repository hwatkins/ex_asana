defmodule Asana.Generated.GraphExportResponse do
  @moduledoc """
  Provides struct and type for a GraphExportResponse
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          new_graph_export: Asana.Generated.GraphExportCompact.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [:gid, :new_graph_export, :resource_subtype, :resource_type, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      new_graph_export: {Asana.Generated.GraphExportCompact, :t},
      resource_subtype: :string,
      resource_type: :string,
      status: {:enum, ["not_started", "in_progress", "succeeded", "failed"]}
    ]
  end
end
