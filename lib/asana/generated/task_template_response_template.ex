defmodule Asana.Generated.TaskTemplateResponseTemplate do
  @moduledoc """
  Provides struct and type for a TaskTemplateResponseTemplate
  """

  @type t :: %__MODULE__{
          attachments: [Asana.Generated.AttachmentCompact.t()] | nil,
          custom_fields: [Asana.Generated.CustomFieldCompact.t()] | nil,
          dependencies: [Asana.Generated.TaskTemplateRecipeCompact.t()] | nil,
          dependents: [Asana.Generated.TaskTemplateRecipeCompact.t()] | nil,
          description: String.t() | nil,
          due_time: String.t() | nil,
          followers: [Asana.Generated.UserCompact.t()] | nil,
          html_description: String.t() | nil,
          memberships: [Asana.Generated.ProjectCompact.t()] | nil,
          name: String.t() | nil,
          relative_due_on: integer | nil,
          relative_start_on: integer | nil,
          subtasks: [Asana.Generated.TaskTemplateRecipeCompact.t()] | nil,
          task_resource_subtype: String.t() | nil
        }

  defstruct [
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
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attachments: [{Asana.Generated.AttachmentCompact, :t}],
      custom_fields: [{Asana.Generated.CustomFieldCompact, :t}],
      dependencies: [{Asana.Generated.TaskTemplateRecipeCompact, :t}],
      dependents: [{Asana.Generated.TaskTemplateRecipeCompact, :t}],
      description: :string,
      due_time: :string,
      followers: [{Asana.Generated.UserCompact, :t}],
      html_description: :string,
      memberships: [{Asana.Generated.ProjectCompact, :t}],
      name: :string,
      relative_due_on: :integer,
      relative_start_on: :integer,
      subtasks: [{Asana.Generated.TaskTemplateRecipeCompact, :t}],
      task_resource_subtype: {:enum, ["default_task", "milestone_task", "approval_task"]}
    ]
  end
end
