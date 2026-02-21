defmodule Asana.Generated.TagResponse do
  @moduledoc """
  Provides struct and type for a TagResponse
  """

  @type t :: %__MODULE__{
          color: String.t() | nil,
          created_at: DateTime.t() | nil,
          followers: [Asana.Generated.UserCompact.t()] | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          permalink_url: String.t() | nil,
          resource_type: String.t() | nil,
          workspace: Asana.Generated.WorkspaceCompact.t() | nil
        }

  defstruct [
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
  def __fields__(type \\ :t)

  def __fields__(:t) do
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
      followers: [{Asana.Generated.UserCompact, :t}],
      gid: :string,
      name: :string,
      notes: :string,
      permalink_url: :string,
      resource_type: :string,
      workspace: {Asana.Generated.WorkspaceCompact, :t}
    ]
  end
end
