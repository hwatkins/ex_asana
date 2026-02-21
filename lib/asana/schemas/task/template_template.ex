defmodule Asana.Task.TemplateTemplate do
  @moduledoc """
  Provides struct and type for a Task.TemplateTemplate
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          attachments: [Asana.Attachment.compact()] | nil,
          custom_fields: [Asana.CustomField.compact()] | nil,
          dependencies: [Asana.Task.Template.Recipe.compact()] | nil,
          dependents: [Asana.Task.Template.Recipe.compact()] | nil,
          description: String.t() | nil,
          due_time: String.t() | nil,
          followers: [Asana.User.compact()] | nil,
          html_description: String.t() | nil,
          memberships: [Asana.Project.compact()] | nil,
          name: String.t() | nil,
          relative_due_on: integer | nil,
          relative_start_on: integer | nil,
          subtasks: [Asana.Task.Template.Recipe.compact()] | nil,
          task_resource_subtype: String.t() | nil
        }

  defstruct [
    :__info__,
    :attachments,
    :custom_fields,
    :dependencies,
    :dependents,
    :description,
    :due_time,
    :followers,
    :html_description,
    :memberships,
    :name,
    :relative_due_on,
    :relative_start_on,
    :subtasks,
    :task_resource_subtype
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      attachments: [{Asana.Attachment, :compact}],
      custom_fields: [{Asana.CustomField, :compact}],
      dependencies: [{Asana.Task.Template.Recipe, :compact}],
      dependents: [{Asana.Task.Template.Recipe, :compact}],
      description: :string,
      due_time: :string,
      followers: [{Asana.User, :compact}],
      html_description: :string,
      memberships: [{Asana.Project, :compact}],
      name: :string,
      relative_due_on: :integer,
      relative_start_on: :integer,
      subtasks: [{Asana.Task.Template.Recipe, :compact}],
      task_resource_subtype: {:enum, ["default_task", "milestone_task", "approval_task"]}
    ]
  end
end
