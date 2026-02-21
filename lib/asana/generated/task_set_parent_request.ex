defmodule Asana.Generated.TaskSetParentRequest do
  @moduledoc """
  Provides struct and type for a TaskSetParentRequest
  """

  @type t :: %__MODULE__{
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          parent: String.t()
        }

  defstruct [:insert_after, :insert_before, :parent]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [insert_after: :string, insert_before: :string, parent: :string]
  end
end
