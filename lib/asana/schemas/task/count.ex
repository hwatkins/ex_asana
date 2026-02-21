defmodule Asana.Task.Count do
  @moduledoc """
  Provides struct and type for a Task.Count
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          num_completed_milestones: integer | nil,
          num_completed_tasks: integer | nil,
          num_incomplete_milestones: integer | nil,
          num_incomplete_tasks: integer | nil,
          num_milestones: integer | nil,
          num_tasks: integer | nil
        }

  defstruct [
    :__info__,
    :num_completed_milestones,
    :num_completed_tasks,
    :num_incomplete_milestones,
    :num_incomplete_tasks,
    :num_milestones,
    :num_tasks
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      num_completed_milestones: :integer,
      num_completed_tasks: :integer,
      num_incomplete_milestones: :integer,
      num_incomplete_tasks: :integer,
      num_milestones: :integer,
      num_tasks: :integer
    ]
  end
end
