defmodule Asana.Generated.AttachmentCompact do
  @moduledoc """
  Provides struct and type for a AttachmentCompact
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:gid, :name, :resource_subtype, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, name: :string, resource_subtype: :string, resource_type: :string]
  end
end
