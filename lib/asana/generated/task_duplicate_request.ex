defmodule Asana.Generated.TaskDuplicateRequest do
  @moduledoc """
  Provides struct and type for a TaskDuplicateRequest
  """

  @type t :: %__MODULE__{include: String.t() | nil, name: String.t() | nil}

  defstruct [:include, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [include: :string, name: :string]
  end
end
