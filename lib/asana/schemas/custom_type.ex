defmodule Asana.CustomType do
  @moduledoc """
  Provides struct and types for a CustomType
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil,
          status_options: [Asana.CustomType.StatusOption.response()] | nil
        }

  defstruct [:__info__, :gid, :name, :resource_type, :status_options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_type: :string]
  end

  def __fields__(:response) do
    [
      gid: :string,
      name: :string,
      resource_type: :string,
      status_options: [{Asana.CustomType.StatusOption, :response}]
    ]
  end
end
