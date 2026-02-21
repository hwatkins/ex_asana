defmodule Asana.Generated.SectionTaskInsertRequest do
  @moduledoc """
  Provides struct and type for a SectionTaskInsertRequest
  """

  @type t :: %__MODULE__{
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          task: String.t()
        }

  defstruct [:insert_after, :insert_before, :task]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [insert_after: :string, insert_before: :string, task: :string]
  end
end
