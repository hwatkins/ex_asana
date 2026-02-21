defmodule Asana.Generated.TaskRequestMemberships do
  @moduledoc """
  Provides struct and type for a TaskRequestMemberships
  """

  @type t :: %__MODULE__{
          project: Asana.Generated.ProjectCompact.t() | nil,
          section: Asana.Generated.SectionCompact.t() | nil
        }

  defstruct [:project, :section]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [project: {Asana.Generated.ProjectCompact, :t}, section: {Asana.Generated.SectionCompact, :t}]
  end
end
