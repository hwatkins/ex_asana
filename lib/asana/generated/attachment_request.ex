defmodule Asana.Generated.AttachmentRequest do
  @moduledoc """
  Provides struct and type for a AttachmentRequest
  """

  @type t :: %__MODULE__{
          connect_to_app: boolean | nil,
          file: binary | nil,
          name: String.t() | nil,
          parent: String.t(),
          resource_subtype: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:connect_to_app, :file, :name, :parent, :resource_subtype, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      connect_to_app: :boolean,
      file: {:string, "binary"},
      name: :string,
      parent: :string,
      resource_subtype: {:enum, ["asana", "external"]},
      url: :string
    ]
  end
end
