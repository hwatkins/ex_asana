defmodule Asana.Generated.TaskResponseExternal do
  @moduledoc """
  Provides struct and type for a TaskResponseExternal
  """

  @type t :: %__MODULE__{data: String.t() | nil, gid: String.t() | nil}

  defstruct [:data, :gid]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: :string, gid: :string]
  end
end
