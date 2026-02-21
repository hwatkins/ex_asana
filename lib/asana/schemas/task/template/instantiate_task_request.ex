defmodule Asana.Task.Template.InstantiateTaskRequest do
  @moduledoc """
  Provides struct and type for a Task.Template.InstantiateTaskRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, name: String.t() | nil}

  defstruct [:__info__, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: :string]
  end
end
