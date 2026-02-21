defmodule Asana.User do
  @moduledoc """
  Typed user schema with forward-compatible unknown field capture in `__info__`.
  """

  alias Asana.Generated.UserCompact
  alias Asana.Generated.UserResponse

  @type compact :: %__MODULE__{
          __info__: map() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map() | nil,
          custom_fields: [Asana.Generated.CustomFieldCompact.t()] | nil,
          email: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          photo: Asana.Generated.UserResponsePhoto.t() | nil,
          resource_type: String.t() | nil,
          workspaces: [Asana.Generated.WorkspaceCompact.t()] | nil
        }

  @type t :: response()

  defstruct [:__info__, :custom_fields, :email, :gid, :name, :photo, :resource_type, :workspaces]

  @spec __fields__(atom()) :: keyword()
  def __fields__(:t), do: __fields__(:response)
  def __fields__(:compact), do: UserCompact.__fields__(:t)
  def __fields__(:response), do: UserResponse.__fields__(:t)
end
