defmodule Asana.Task.Template.Recipe do
  @moduledoc """
  Provides struct and type for a Task.Template.Recipe
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          name: String.t() | nil,
          task_resource_subtype: String.t() | nil
        }

  defstruct [:__info__, :name, :task_resource_subtype]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      name: :string,
      task_resource_subtype: {:enum, ["default_task", "milestone_task", "approval_task"]}
    ]
  end
end
