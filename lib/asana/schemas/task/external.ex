defmodule Asana.Task.External do
  @moduledoc """
  Provides struct and type for a Task.External
  """
  use Asana.Encoder

  @type response :: %__MODULE__{__info__: map, data: String.t() | nil, gid: String.t() | nil}

  defstruct [:__info__, :data, :gid]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [data: :string, gid: :string]
  end
end
