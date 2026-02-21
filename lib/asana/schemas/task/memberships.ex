defmodule Asana.Task.Memberships do
  @moduledoc """
  Provides struct and type for a Task.Memberships
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          project: Asana.Project.compact() | nil,
          section: Asana.Section.compact() | nil
        }

  defstruct [:__info__, :project, :section]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [project: {Asana.Project, :compact}, section: {Asana.Section, :compact}]
  end
end
