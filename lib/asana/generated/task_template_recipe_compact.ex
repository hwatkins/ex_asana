defmodule Asana.Generated.TaskTemplateRecipeCompact do
  @moduledoc """
  Provides struct and type for a TaskTemplateRecipeCompact
  """

  @type t :: %__MODULE__{name: String.t() | nil, task_resource_subtype: String.t() | nil}

  defstruct [:name, :task_resource_subtype]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: :string,
      task_resource_subtype: {:enum, ["default_task", "milestone_task", "approval_task"]}
    ]
  end
end
