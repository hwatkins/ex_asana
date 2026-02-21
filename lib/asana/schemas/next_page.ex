defmodule Asana.NextPage do
  @moduledoc """
  Provides struct and type for a NextPage
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          offset: String.t() | nil,
          path: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:__info__, :offset, :path, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [offset: :string, path: :string, uri: {:string, "uri"}]
  end
end
