defmodule Asana.Workspace do
  @moduledoc """
  Typed workspace schema with forward-compatible unknown field capture in `__info__`.
  """

  alias Asana.Generated.WorkspaceCompact
  alias Asana.Generated.WorkspaceResponse

  @type compact :: %__MODULE__{
          __info__: map() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map() | nil,
          email_domains: [String.t()] | nil,
          gid: String.t() | nil,
          is_organization: boolean() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type t :: response()

  defstruct [:__info__, :email_domains, :gid, :is_organization, :name, :resource_type]

  @spec __fields__(atom()) :: keyword()
  def __fields__(:t), do: __fields__(:response)
  def __fields__(:compact), do: WorkspaceCompact.__fields__(:t)
  def __fields__(:response), do: WorkspaceResponse.__fields__(:t)
end
