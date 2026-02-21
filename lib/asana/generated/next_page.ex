defmodule Asana.Generated.NextPage do
  @moduledoc """
  Provides struct and type for a NextPage
  """

  @type t :: %__MODULE__{offset: String.t() | nil, path: String.t() | nil, uri: String.t() | nil}

  defstruct [:offset, :path, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [offset: :string, path: :string, uri: {:string, "uri"}]
  end
end
