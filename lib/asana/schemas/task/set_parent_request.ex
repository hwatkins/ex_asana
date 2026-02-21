defmodule Asana.Task.SetParentRequest do
  @moduledoc """
  Provides struct and type for a Task.SetParentRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          parent: String.t()
        }

  defstruct [:__info__, :insert_after, :insert_before, :parent]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [insert_after: :string, insert_before: :string, parent: :string]
  end
end
