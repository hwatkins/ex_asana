defmodule Asana.Generated.PortfolioResponse do
  @moduledoc """
  Provides struct and type for a PortfolioResponse
  """

  @type t :: %__MODULE__{
          archived: boolean | nil,
          color: String.t() | nil,
          created_at: DateTime.t() | nil,
          created_by: Asana.Generated.UserCompact.t() | nil,
          current_status_update: Asana.Generated.PortfolioResponseCurrentStatusUpdate.t() | nil,
          custom_field_settings: [Asana.Generated.CustomFieldSettingResponse.t()] | nil,
          custom_fields: [Asana.Generated.CustomFieldCompact.t()] | nil,
          default_access_level: String.t() | nil,
          due_on: Date.t() | nil,
          gid: String.t() | nil,
          members: [Asana.Generated.UserCompact.t()] | nil,
          name: String.t() | nil,
          owner: Asana.Generated.UserCompact.t() | nil,
          permalink_url: String.t() | nil,
          privacy_setting: String.t() | nil,
          project_templates: [Asana.Generated.ProjectTemplateCompact.t()] | nil,
          public: boolean | nil,
          resource_type: String.t() | nil,
          start_on: Date.t() | nil,
          workspace: Asana.Generated.PortfolioResponseWorkspace.t() | nil
        }

  defstruct [
    :archived,
    :color,
    :created_at,
    :created_by,
    :current_status_update,
    :custom_field_settings,
    :custom_fields,
    :default_access_level,
    :due_on,
    :gid,
    :members,
    :name,
    :owner,
    :permalink_url,
    :privacy_setting,
    :project_templates,
    :public,
    :resource_type,
    :start_on,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archived: :boolean,
      color:
        {:enum,
         [
           "dark-pink",
           "dark-green",
           "dark-blue",
           "dark-red",
           "dark-teal",
           "dark-brown",
           "dark-orange",
           "dark-purple",
           "dark-warm-gray",
           "light-pink",
           "light-green",
           "light-blue",
           "light-red",
           "light-teal",
           "light-brown",
           "light-orange",
           "light-purple",
           "light-warm-gray"
         ]},
      created_at: {:string, "date-time"},
      created_by: {Asana.Generated.UserCompact, :t},
      current_status_update: {Asana.Generated.PortfolioResponseCurrentStatusUpdate, :t},
      custom_field_settings: [{Asana.Generated.CustomFieldSettingResponse, :t}],
      custom_fields: [{Asana.Generated.CustomFieldCompact, :t}],
      default_access_level: {:enum, ["admin", "editor", "viewer"]},
      due_on: {:string, "date"},
      gid: :string,
      members: [{Asana.Generated.UserCompact, :t}],
      name: :string,
      owner: {Asana.Generated.UserCompact, :t},
      permalink_url: :string,
      privacy_setting: {:enum, ["public_to_domain", "members_only"]},
      project_templates: [{Asana.Generated.ProjectTemplateCompact, :t}],
      public: :boolean,
      resource_type: :string,
      start_on: {:string, "date"},
      workspace: {Asana.Generated.PortfolioResponseWorkspace, :t}
    ]
  end
end
