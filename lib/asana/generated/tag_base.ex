defmodule Asana.Generated.TagBase do
  @moduledoc """
  Provides struct and type for a TagBase
  """

  @type t :: %__MODULE__{
          color: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:color, :gid, :name, :notes, :resource_type]

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
      gid: :string,
      name: :string,
      notes: :string,
      resource_type: :string
    ]
  end
end
