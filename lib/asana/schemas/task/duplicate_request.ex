defmodule Asana.Task.DuplicateRequest do
  @moduledoc """
  Provides struct and type for a Task.DuplicateRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, include: String.t() | nil, name: String.t() | nil}

  defstruct [:__info__, :include, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [include: :string, name: :string]
  end
end
