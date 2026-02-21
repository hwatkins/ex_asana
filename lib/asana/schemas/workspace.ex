defmodule Asana.Workspace do
  @moduledoc """
  Provides struct and types for a Workspace
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
          email_domains: [String.t()] | nil,
          gid: String.t() | nil,
          is_organization: boolean | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :email_domains, :gid, :is_organization, :name, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_type: :string]
  end

  def __fields__(:response) do
    [
      email_domains: [string: "uri"],
      gid: :string,
      is_organization: :boolean,
      name: :string,
      resource_type: :string
    ]
  end
end
