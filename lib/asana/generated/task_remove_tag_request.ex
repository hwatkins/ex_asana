defmodule Asana.Generated.TaskRemoveTagRequest do
  @moduledoc """
  Provides struct and type for a TaskRemoveTagRequest
  """

  @type t :: %__MODULE__{tag: String.t()}

  defstruct [:tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tag: :string]
  end
end
