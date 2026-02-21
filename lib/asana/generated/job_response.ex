defmodule Asana.Generated.JobResponse do
  @moduledoc """
  Provides struct and type for a JobResponse
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          new_graph_export: Asana.Generated.GraphExportCompact.t() | nil,
          new_project: Asana.Generated.ProjectCompact.t() | nil,
          new_project_template: Asana.Generated.ProjectTemplateCompact.t() | nil,
          new_resource_export: Asana.Generated.ResourceExportCompact.t() | nil,
          new_task: Asana.Generated.JobResponseNewTask.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :gid,
    :new_graph_export,
    :new_project,
    :new_project_template,
    :new_resource_export,
    :new_task,
    :resource_subtype,
    :resource_type,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      new_graph_export: {Asana.Generated.GraphExportCompact, :t},
      new_project: {Asana.Generated.ProjectCompact, :t},
      new_project_template: {Asana.Generated.ProjectTemplateCompact, :t},
      new_resource_export: {Asana.Generated.ResourceExportCompact, :t},
      new_task: {Asana.Generated.JobResponseNewTask, :t},
      resource_subtype: :string,
      resource_type: :string,
      status: {:enum, ["not_started", "in_progress", "succeeded", "failed"]}
    ]
  end
end
