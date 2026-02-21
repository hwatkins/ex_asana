defmodule Asana.Generated.DateVariableRequest do
  @moduledoc """
  Provides struct and type for a DateVariableRequest
  """

  @type t :: %__MODULE__{gid: String.t() | nil, value: DateTime.t() | nil}

  defstruct [:gid, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, value: {:string, "date-time"}]
  end
end
