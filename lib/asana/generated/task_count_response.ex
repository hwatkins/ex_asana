defmodule Asana.Generated.TaskCountResponse do
  @moduledoc """
  Provides struct and type for a TaskCountResponse
  """

  @type t :: %__MODULE__{
          num_completed_milestones: integer | nil,
          num_completed_tasks: integer | nil,
          num_incomplete_milestones: integer | nil,
          num_incomplete_tasks: integer | nil,
          num_milestones: integer | nil,
          num_tasks: integer | nil
        }

  defstruct [
    :num_completed_milestones,
    :num_completed_tasks,
    :num_incomplete_milestones,
    :num_incomplete_tasks,
    :num_milestones,
    :num_tasks
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
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
