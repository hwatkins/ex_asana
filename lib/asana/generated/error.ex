defmodule Asana.Generated.Error do
  @moduledoc """
  Provides struct and type for a Error
  """

  @type t :: %__MODULE__{
          help: String.t() | nil,
          message: String.t() | nil,
          phrase: String.t() | nil
        }

  defstruct [:help, :message, :phrase]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [help: :string, message: :string, phrase: :string]
  end
end
