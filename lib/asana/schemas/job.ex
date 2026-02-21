defmodule Asana.Job do
  @moduledoc """
  Provides struct and type for a Job
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          new_graph_export: Asana.GraphExport.compact() | nil,
          new_project: Asana.Project.compact() | nil,
          new_project_template: Asana.Project.Template.compact() | nil,
          new_resource_export: Asana.ResourceExport.compact() | nil,
          new_task: Asana.Job.NewTask.response() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :__info__,
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
  def __fields__(:response) do
    [
      gid: :string,
      new_graph_export: {Asana.GraphExport, :compact},
      new_project: {Asana.Project, :compact},
      new_project_template: {Asana.Project.Template, :compact},
      new_resource_export: {Asana.ResourceExport, :compact},
      new_task: {Asana.Job.NewTask, :response},
      resource_subtype: :string,
      resource_type: :string,
      status: {:enum, ["not_started", "in_progress", "succeeded", "failed"]}
    ]
  end
end
