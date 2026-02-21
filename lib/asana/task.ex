# credo:disable-for-this-file Credo.Check.Warning.StructFieldAmount
defmodule Asana.Task do
  @moduledoc """
  Typed Task schema with forward-compatible unknown field capture in `__info__`.
  """

  @type compact :: %__MODULE__{
          __info__: map() | nil,
          created_by: map() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map() | nil,
          actual_time_minutes: number() | nil,
          approval_status: String.t() | nil,
          assigned_by: Asana.Generated.TaskResponseAssignedBy.t() | nil,
          assignee: Asana.Generated.TaskResponseAssignee.t() | nil,
          assignee_section: Asana.Generated.TaskResponseAssigneeSection.t() | nil,
          assignee_status: String.t() | nil,
          completed: boolean() | nil,
          completed_at: DateTime.t() | String.t() | nil,
          completed_by: Asana.Generated.TaskResponseCompletedBy.t() | nil,
          created_at: DateTime.t() | String.t() | nil,
          created_by: Asana.Generated.TaskResponseCreatedBy.t() | nil,
          custom_fields: [Asana.Generated.CustomFieldResponse.t()] | nil,
          custom_type: Asana.Generated.TaskResponseCustomType.t() | nil,
          custom_type_status_option: Asana.Generated.TaskResponseCustomTypeStatusOption.t() | nil,
          dependencies: [Asana.Generated.AsanaResource.t()] | nil,
          dependents: [Asana.Generated.AsanaResource.t()] | nil,
          due_at: DateTime.t() | String.t() | nil,
          due_on: Date.t() | String.t() | nil,
          external: Asana.Generated.TaskResponseExternal.t() | nil,
          followers: [Asana.Generated.UserCompact.t()] | nil,
          gid: String.t() | nil,
          hearted: boolean() | nil,
          hearts: [Asana.Generated.Like.t()] | nil,
          html_notes: String.t() | nil,
          is_rendered_as_separator: boolean() | nil,
          liked: boolean() | nil,
          likes: [Asana.Generated.Like.t()] | nil,
          memberships: [Asana.Generated.TaskResponseMemberships.t()] | nil,
          modified_at: DateTime.t() | String.t() | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          num_hearts: integer() | nil,
          num_likes: integer() | nil,
          num_subtasks: integer() | nil,
          parent: Asana.Generated.TaskResponseParent.t() | nil,
          permalink_url: String.t() | nil,
          projects: [Asana.Generated.ProjectCompact.t()] | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          start_at: DateTime.t() | String.t() | nil,
          start_on: Date.t() | String.t() | nil,
          tags: [Asana.Generated.TagCompact.t()] | nil,
          workspace: Asana.Generated.TaskResponseWorkspace.t() | nil
        }

  @type t :: response()

  defstruct [
    :__info__,
    :actual_time_minutes,
    :approval_status,
    :assigned_by,
    :assignee,
    :assignee_section,
    :assignee_status,
    :completed,
    :completed_at,
    :completed_by,
    :created_at,
    :created_by,
    :custom_fields,
    :custom_type,
    :custom_type_status_option,
    :dependencies,
    :dependents,
    :due_at,
    :due_on,
    :external,
    :followers,
    :gid,
    :hearted,
    :hearts,
    :html_notes,
    :is_rendered_as_separator,
    :liked,
    :likes,
    :memberships,
    :modified_at,
    :name,
    :notes,
    :num_hearts,
    :num_likes,
    :num_subtasks,
    :parent,
    :permalink_url,
    :projects,
    :resource_subtype,
    :resource_type,
    :start_at,
    :start_on,
    :tags,
    :workspace
  ]

  @spec __fields__(atom()) :: keyword()
  def __fields__(:t), do: __fields__(:response)

  def __fields__(:compact) do
    [
      created_by: :map,
      gid: :string,
      name: :string,
      resource_subtype: {:enum, ["default_task", "milestone", "approval", "custom"]},
      resource_type: :string
    ]
  end

  def __fields__(:response) do
    [
      actual_time_minutes: :number,
      approval_status: {:enum, ["pending", "approved", "rejected", "changes_requested"]},
      assigned_by: {Asana.Generated.TaskResponseAssignedBy, :t},
      assignee: {Asana.Generated.TaskResponseAssignee, :t},
      assignee_section: {Asana.Generated.TaskResponseAssigneeSection, :t},
      assignee_status: {:enum, ["today", "upcoming", "later", "new", "inbox"]},
      completed: :boolean,
      completed_at: {:string, :date_time},
      completed_by: {Asana.Generated.TaskResponseCompletedBy, :t},
      created_at: {:string, :date_time},
      created_by: {Asana.Generated.TaskResponseCreatedBy, :t},
      custom_fields: [{Asana.Generated.CustomFieldResponse, :t}],
      custom_type: {Asana.Generated.TaskResponseCustomType, :t},
      custom_type_status_option: {Asana.Generated.TaskResponseCustomTypeStatusOption, :t},
      dependencies: [{Asana.Generated.AsanaResource, :t}],
      dependents: [{Asana.Generated.AsanaResource, :t}],
      due_at: {:string, :date_time},
      due_on: {:string, :date},
      external: {Asana.Generated.TaskResponseExternal, :t},
      followers: [{Asana.Generated.UserCompact, :t}],
      gid: :string,
      hearted: :boolean,
      hearts: [{Asana.Generated.Like, :t}],
      html_notes: :string,
      is_rendered_as_separator: :boolean,
      liked: :boolean,
      likes: [{Asana.Generated.Like, :t}],
      memberships: [{Asana.Generated.TaskResponseMemberships, :t}],
      modified_at: {:string, :date_time},
      name: :string,
      notes: :string,
      num_hearts: :integer,
      num_likes: :integer,
      num_subtasks: :integer,
      parent: {Asana.Generated.TaskResponseParent, :t},
      permalink_url: :string,
      projects: [{Asana.Generated.ProjectCompact, :t}],
      resource_subtype: {:enum, ["default_task", "milestone", "approval", "custom"]},
      resource_type: :string,
      start_at: {:string, :date_time},
      start_on: {:string, :date},
      tags: [{Asana.Generated.TagCompact, :t}],
      workspace: {Asana.Generated.TaskResponseWorkspace, :t}
    ]
  end
end
