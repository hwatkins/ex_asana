defmodule Asana.User do
  @moduledoc """
  Provides struct and types for a User
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
          custom_fields: [Asana.CustomField.compact()] | nil,
          email: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          photo: Asana.User.Photo.response() | nil,
          resource_type: String.t() | nil,
          workspaces: [Asana.Workspace.compact()] | nil
        }

  defstruct [:__info__, :custom_fields, :email, :gid, :name, :photo, :resource_type, :workspaces]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_type: :string]
  end

  def __fields__(:response) do
    [
      custom_fields: [{Asana.CustomField, :compact}],
      email: {:string, "email"},
      gid: :string,
      name: :string,
      photo: {Asana.User.Photo, :response},
      resource_type: :string,
      workspaces: [{Asana.Workspace, :compact}]
    ]
  end
end
