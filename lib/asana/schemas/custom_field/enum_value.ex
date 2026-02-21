defmodule Asana.CustomField.EnumValue do
  @moduledoc """
  Provides struct and type for a CustomField.EnumValue
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          color: String.t() | nil,
          enabled: boolean | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :color, :enabled, :gid, :name, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [color: :string, enabled: :boolean, gid: :string, name: :string, resource_type: :string]
  end
end
