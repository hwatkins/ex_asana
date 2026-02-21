defmodule Asana.Portfolio do
  @moduledoc """
  Provides struct and types for a Portfolio
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
          archived: boolean | nil,
          color: String.t() | nil,
          created_at: DateTime.t() | nil,
          created_by: Asana.User.compact() | nil,
          current_status_update: Asana.Portfolio.CurrentStatusUpdate.response() | nil,
          custom_field_settings: [Asana.CustomField.Setting.response()] | nil,
          custom_fields: [Asana.CustomField.compact()] | nil,
          default_access_level: String.t() | nil,
          due_on: Date.t() | nil,
          gid: String.t() | nil,
          members: [Asana.User.compact()] | nil,
          name: String.t() | nil,
          owner: Asana.User.compact() | nil,
          permalink_url: String.t() | nil,
          privacy_setting: String.t() | nil,
          project_templates: [Asana.Project.Template.compact()] | nil,
          public: boolean | nil,
          resource_type: String.t() | nil,
          start_on: Date.t() | nil,
          workspace: Asana.Portfolio.Workspace.response() | nil
        }

  defstruct [
    :__info__,
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
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_type: :string]
  end

  def __fields__(:response) do
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
      created_by: {Asana.User, :compact},
      current_status_update: {Asana.Portfolio.CurrentStatusUpdate, :response},
      custom_field_settings: [{Asana.CustomField.Setting, :response}],
      custom_fields: [{Asana.CustomField, :compact}],
      default_access_level: {:enum, ["admin", "editor", "viewer"]},
      due_on: {:string, "date"},
      gid: :string,
      members: [{Asana.User, :compact}],
      name: :string,
      owner: {Asana.User, :compact},
      permalink_url: :string,
      privacy_setting: {:enum, ["public_to_domain", "members_only"]},
      project_templates: [{Asana.Project.Template, :compact}],
      public: :boolean,
      resource_type: :string,
      start_on: {:string, "date"},
      workspace: {Asana.Portfolio.Workspace, :response}
    ]
  end
end
