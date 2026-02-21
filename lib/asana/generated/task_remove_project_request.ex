defmodule Asana.Generated.TaskRemoveProjectRequest do
  @moduledoc """
  Provides struct and type for a TaskRemoveProjectRequest
  """

  @type t :: %__MODULE__{project: String.t()}

  defstruct [:project]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [project: :string]
  end
end
