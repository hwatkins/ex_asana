defmodule Asana.Tag do
  @moduledoc """
  Provides struct and types for a Tag
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
          color: String.t() | nil,
          created_at: DateTime.t() | nil,
          followers: [Asana.User.compact()] | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          permalink_url: String.t() | nil,
          resource_type: String.t() | nil,
          workspace: Asana.Workspace.compact() | nil
        }

  defstruct [
    :__info__,
    :color,
    :created_at,
    :followers,
    :gid,
    :name,
    :notes,
    :permalink_url,
    :resource_type,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_type: :string]
  end

  def __fields__(:response) do
    [
      color:
        {:enum,
         [
           "dark-pink",
           "dark-green",
           "dark-blue",
           "dark-red",
           "dark-teal",
           "dark-brown",
           "dark-orange",
           "dark-purple",
           "dark-warm-gray",
           "light-pink",
           "light-green",
           "light-blue",
           "light-red",
           "light-teal",
           "light-brown",
           "light-orange",
           "light-purple",
           "light-warm-gray",
           nil
         ]},
      created_at: {:string, "date-time"},
      followers: [{Asana.User, :compact}],
      gid: :string,
      name: :string,
      notes: :string,
      permalink_url: :string,
      resource_type: :string,
      workspace: {Asana.Workspace, :compact}
    ]
  end
end
