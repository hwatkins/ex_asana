defmodule Asana.Task.RequestMemberships do
  @moduledoc """
  Provides struct and type for a Task.RequestMemberships
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          project: Asana.Project.compact() | nil,
          section: Asana.Section.compact() | nil
        }

  defstruct [:__info__, :project, :section]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [project: {Asana.Project, :compact}, section: {Asana.Section, :compact}]
  end
end
