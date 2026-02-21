defmodule Asana.CustomType.StatusOption do
  @moduledoc """
  Provides struct and type for a CustomType.StatusOption
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          color: String.t() | nil,
          completion_state: String.t() | nil,
          enabled: boolean | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :color, :completion_state, :enabled, :gid, :name, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
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
