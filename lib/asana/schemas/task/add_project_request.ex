defmodule Asana.Task.AddProjectRequest do
  @moduledoc """
  Provides struct and type for a Task.AddProjectRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          project: String.t(),
          section: String.t() | nil
        }

  defstruct [:__info__, :insert_after, :insert_before, :project, :section]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [insert_after: :string, insert_before: :string, project: :string, section: :string]
  end
end
