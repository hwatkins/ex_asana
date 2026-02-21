defmodule Asana.Generated.EnumOptionRequest do
  @moduledoc """
  Provides struct and type for a EnumOptionRequest
  """

  @type t :: %__MODULE__{
          color: String.t() | nil,
          enabled: boolean | nil,
          gid: String.t() | nil,
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:color, :enabled, :gid, :insert_after, :insert_before, :name, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      color: :string,
      enabled: :boolean,
      gid: :string,
      insert_after: :string,
      insert_before: :string,
      name: :string,
      resource_type: :string
    ]
  end
end
