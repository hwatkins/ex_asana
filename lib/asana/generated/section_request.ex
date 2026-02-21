defmodule Asana.Generated.SectionRequest do
  @moduledoc """
  Provides struct and type for a SectionRequest
  """

  @type t :: %__MODULE__{
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          name: String.t()
        }

  defstruct [:insert_after, :insert_before, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [insert_after: :string, insert_before: :string, name: :string]
  end
end
