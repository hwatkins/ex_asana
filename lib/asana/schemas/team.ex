defmodule Asana.Team do
  @moduledoc """
  Provides struct and types for a Team
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          custom_field_settings: [Asana.CustomField.Setting.response()] | nil,
          description: String.t() | nil,
          edit_team_name_or_description_access_level: String.t() | nil,
          edit_team_visibility_or_trash_team_access_level: String.t() | nil,
          endorsed: boolean | nil,
          gid: String.t() | nil,
          guest_invite_management_access_level: String.t() | nil,
          html_description: String.t() | nil,
          join_request_management_access_level: String.t() | nil,
          member_invite_management_access_level: String.t() | nil,
          name: String.t() | nil,
          organization: Asana.Team.Organization.response() | nil,
          permalink_url: String.t() | nil,
          resource_type: String.t() | nil,
          team_content_management_access_level: String.t() | nil,
          team_member_removal_access_level: String.t() | nil,
          visibility: String.t() | nil
        }

  defstruct [
    :__info__,
    :custom_field_settings,
    :description,
    :edit_team_name_or_description_access_level,
    :edit_team_visibility_or_trash_team_access_level,
    :endorsed,
    :gid,
    :guest_invite_management_access_level,
    :html_description,
    :join_request_management_access_level,
    :member_invite_management_access_level,
    :name,
    :organization,
    :permalink_url,
    :resource_type,
    :team_content_management_access_level,
    :team_member_removal_access_level,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_type: :string]
  end

  def __fields__(:response) do
    [
      custom_field_settings: [{Asana.CustomField.Setting, :response}],
      description: :string,
      edit_team_name_or_description_access_level:
        {:enum, ["all_team_members", "only_team_admins"]},
      edit_team_visibility_or_trash_team_access_level:
        {:enum, ["all_team_members", "only_team_admins"]},
      endorsed: :boolean,
      gid: :string,
      guest_invite_management_access_level: {:enum, ["all_team_members", "only_team_admins"]},
      html_description: :string,
      join_request_management_access_level: {:enum, ["all_team_members", "only_team_admins"]},
      member_invite_management_access_level: {:enum, ["all_team_members", "only_team_admins"]},
      name: :string,
      organization: {Asana.Team.Organization, :response},
      permalink_url: :string,
      resource_type: :string,
      team_content_management_access_level: {:enum, ["no_restriction", "only_team_admins"]},
      team_member_removal_access_level: {:enum, ["all_team_members", "only_team_admins"]},
      visibility: {:enum, ["secret", "request_to_join", "public"]}
    ]
  end
end
