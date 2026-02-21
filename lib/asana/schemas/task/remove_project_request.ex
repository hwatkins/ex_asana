defmodule Asana.Task.RemoveProjectRequest do
  @moduledoc """
  Provides struct and type for a Task.RemoveProjectRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, project: String.t()}

  defstruct [:__info__, :project]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [project: :string]
  end
end
