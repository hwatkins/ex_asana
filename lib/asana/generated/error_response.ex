defmodule Asana.Generated.ErrorResponse do
  @moduledoc """
  Provides struct and type for a ErrorResponse
  """

  @type t :: %__MODULE__{errors: [Asana.Generated.Error.t()] | nil}

  defstruct [:errors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [errors: [{Asana.Generated.Error, :t}]]
  end
end
