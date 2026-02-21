defmodule Asana.Task.RequestExternal do
  @moduledoc """
  Provides struct and type for a Task.RequestExternal
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, data: String.t() | nil, gid: String.t() | nil}

  defstruct [:__info__, :data, :gid]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: :string, gid: :string]
  end
end
