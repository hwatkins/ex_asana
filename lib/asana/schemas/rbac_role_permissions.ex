defmodule Asana.RbacRolePermissions do
  @moduledoc """
  Provides struct and type for a RbacRolePermissions
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          allowed_guest_invites: String.t() | nil,
          assign_roles: boolean | nil,
          create_and_edit_ai_automations: boolean | nil,
          create_app_authorization: boolean | nil,
          create_global_custom_fields: boolean | nil,
          create_pat_authorization: boolean | nil,
          create_team: boolean | nil,
          download_mobile_attachments: boolean | nil,
          export_project_data: boolean | nil,
          import_data: boolean | nil,
          manage_roles: boolean | nil,
          proactive_ai: boolean | nil,
          share_goal_with_domain: boolean | nil,
          share_portfolios_with_org: boolean | nil,
          standard_ai: boolean | nil,
          task_deletion_policy: String.t() | nil,
          upload_attachments: boolean | nil
        }

  defstruct [
    :__info__,
    :allowed_guest_invites,
    :assign_roles,
    :create_and_edit_ai_automations,
    :create_app_authorization,
    :create_global_custom_fields,
    :create_pat_authorization,
    :create_team,
    :download_mobile_attachments,
    :export_project_data,
    :import_data,
    :manage_roles,
    :proactive_ai,
    :share_goal_with_domain,
    :share_portfolios_with_org,
    :standard_ai,
    :task_deletion_policy,
    :upload_attachments
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      allowed_guest_invites: {:enum, ["all", "none"]},
      assign_roles: :boolean,
      create_and_edit_ai_automations: :boolean,
      create_app_authorization: :boolean,
      create_global_custom_fields: :boolean,
      create_pat_authorization: :boolean,
      create_team: :boolean,
      download_mobile_attachments: :boolean,
      export_project_data: :boolean,
      import_data: :boolean,
      manage_roles: :boolean,
      proactive_ai: :boolean,
      share_goal_with_domain: :boolean,
      share_portfolios_with_org: :boolean,
      standard_ai: :boolean,
      task_deletion_policy: {:enum, ["all", "owned", "none"]},
      upload_attachments: :boolean
    ]
  end
end
