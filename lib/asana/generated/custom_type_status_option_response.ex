defmodule Asana.Generated.CustomTypeStatusOptionResponse do
  @moduledoc """
  Provides struct and type for a CustomTypeStatusOptionResponse
  """

  @type t :: %__MODULE__{
          color: String.t() | nil,
          completion_state: String.t() | nil,
          enabled: boolean | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:color, :completion_state, :enabled, :gid, :name, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      color: :string,
      completion_state: :string,
      enabled: :boolean,
      gid: :string,
      name: :string,
      resource_type: :string
    ]
  end
end
