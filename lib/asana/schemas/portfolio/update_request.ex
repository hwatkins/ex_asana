defmodule Asana.Portfolio.UpdateRequest do
  @moduledoc """
  Provides struct and type for a Portfolio.UpdateRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          archived: boolean | nil,
          color: String.t() | nil,
          custom_fields: map | nil,
          default_access_level: String.t() | nil,
          due_on: Date.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil,
          start_on: Date.t() | nil
        }

  defstruct [
    :__info__,
    :archived,
    :color,
    :custom_fields,
    :default_access_level,
    :due_on,
    :gid,
    :name,
    :resource_type,
    :start_on
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archived: :boolean,
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
           "light-warm-gray"
         ]},
      custom_fields: :map,
      default_access_level: {:enum, ["admin", "editor", "viewer"]},
      due_on: {:string, "date"},
      gid: :string,
      name: :string,
      resource_type: :string,
      start_on: {:string, "date"}
    ]
  end
end
