defmodule Asana.Task.RemoveTagRequest do
  @moduledoc """
  Provides struct and type for a Task.RemoveTagRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, tag: String.t()}

  defstruct [:__info__, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tag: :string]
  end
end
