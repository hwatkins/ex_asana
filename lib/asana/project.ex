# credo:disable-for-this-file Credo.Check.Warning.StructFieldAmount
defmodule Asana.Project do
  @moduledoc """
  Typed project schema with forward-compatible unknown field capture in `__info__`.
  """

  alias Asana.Generated.ProjectCompact
  alias Asana.Generated.ProjectResponse

  @type compact :: %__MODULE__{
          __info__: map() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map() | nil,
          archived: boolean() | nil,
          color: String.t() | nil,
          completed: boolean() | nil,
          completed_at: DateTime.t() | String.t() | nil,
          completed_by: Asana.Generated.ProjectResponseCompletedBy.t() | nil,
          created_at: DateTime.t() | String.t() | nil,
          created_from_template: Asana.Generated.ProjectResponseCreatedFromTemplate.t() | nil,
          current_status: Asana.Generated.ProjectResponseCurrentStatus.t() | nil,
          current_status_update: Asana.Generated.ProjectResponseCurrentStatusUpdate.t() | nil,
          custom_field_settings: [Asana.Generated.CustomFieldSettingResponse.t()] | nil,
          custom_fields: [Asana.Generated.CustomFieldCompact.t()] | nil,
          default_access_level: String.t() | nil,
          default_view: String.t() | nil,
          due_date: Date.t() | String.t() | nil,
          due_on: Date.t() | String.t() | nil,
          followers: [Asana.Generated.UserCompact.t()] | nil,
          gid: String.t() | nil,
          html_notes: String.t() | nil,
          icon: String.t() | nil,
          members: [Asana.Generated.UserCompact.t()] | nil,
          minimum_access_level_for_customization: String.t() | nil,
          minimum_access_level_for_sharing: String.t() | nil,
          modified_at: DateTime.t() | String.t() | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          owner: Asana.Generated.ProjectResponseOwner.t() | nil,
          permalink_url: String.t() | nil,
          privacy_setting: String.t() | nil,
          project_brief: Asana.Generated.ProjectResponseProjectBrief.t() | nil,
          public: boolean() | nil,
          resource_type: String.t() | nil,
          start_on: Date.t() | String.t() | nil,
          team: Asana.Generated.ProjectResponseTeam.t() | nil,
          workspace: Asana.Generated.ProjectResponseWorkspace.t() | nil
        }

  @type t :: response()

  defstruct [
    :__info__,
    :archived,
    :color,
    :completed,
    :completed_at,
    :completed_by,
    :created_at,
    :created_from_template,
    :current_status,
    :current_status_update,
    :custom_field_settings,
    :custom_fields,
    :default_access_level,
    :default_view,
    :due_date,
    :due_on,
    :followers,
    :gid,
    :html_notes,
    :icon,
    :members,
    :minimum_access_level_for_customization,
    :minimum_access_level_for_sharing,
    :modified_at,
    :name,
    :notes,
    :owner,
    :permalink_url,
    :privacy_setting,
    :project_brief,
    :public,
    :resource_type,
    :start_on,
    :team,
    :workspace
  ]

  @spec __fields__(atom()) :: keyword()
  def __fields__(:t), do: __fields__(:response)
  def __fields__(:compact), do: ProjectCompact.__fields__(:t)
  def __fields__(:response), do: ProjectResponse.__fields__(:t)
end
