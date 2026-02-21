defmodule Asana.Error do
  @moduledoc """
  Provides struct and types for a Error
  """
  use Asana.Encoder

  @type response :: %__MODULE__{__info__: map, errors: [Asana.Error.t()] | nil}

  @type t :: %__MODULE__{
          __info__: map,
          help: String.t() | nil,
          message: String.t() | nil,
          phrase: String.t() | nil
        }

  defstruct [:__info__, :errors, :help, :message, :phrase]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:response) do
    [errors: [{Asana.Error, :t}]]
  end

  def __fields__(:t) do
    [help: :string, message: :string, phrase: :string]
  end
end
