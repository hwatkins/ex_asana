defmodule Asana.Generated.GraphExportCompact do
  @moduledoc """
  Provides struct and type for a GraphExportCompact
  """

  @type t :: %__MODULE__{
          completed_at: DateTime.t() | nil,
          created_at: DateTime.t() | nil,
          download_url: String.t() | nil,
          gid: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:completed_at, :created_at, :download_url, :gid, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completed_at: {:string, "date-time"},
      created_at: {:string, "date-time"},
      download_url: {:string, "uri"},
      gid: :string,
      resource_type: :string
    ]
  end
end
