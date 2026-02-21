defmodule Asana.Generated.DateVariableCompact do
  @moduledoc """
  Provides struct and type for a DateVariableCompact
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:description, :gid, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, gid: :string, name: :string]
  end
end
