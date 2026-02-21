defmodule Asana.Generated.GoalResponse do
  @moduledoc """
  Provides struct and type for a GoalResponse
  """

  @type t :: %__MODULE__{
          current_status_update: Asana.Generated.GoalResponseCurrentStatusUpdate.t() | nil,
          custom_field_settings: [Asana.Generated.CustomFieldSettingResponse.t()] | nil,
          custom_fields: [Asana.Generated.CustomFieldCompact.t()] | nil,
          due_on: String.t() | nil,
          followers: [Asana.Generated.UserCompact.t()] | nil,
          gid: String.t() | nil,
          html_notes: String.t() | nil,
          is_workspace_level: boolean | nil,
          liked: boolean | nil,
          likes: [Asana.Generated.Like.t()] | nil,
          metric: Asana.Generated.GoalResponseMetric.t() | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          num_likes: integer | nil,
          owner: Asana.Generated.GoalResponseOwner.t() | nil,
          resource_type: String.t() | nil,
          start_on: String.t() | nil,
          status: String.t() | nil,
          team: Asana.Generated.GoalResponseTeam.t() | nil,
          time_period: Asana.Generated.GoalResponseTimePeriod.t() | nil,
          workspace: Asana.Generated.GoalResponseWorkspace.t() | nil
        }

  defstruct [
    :current_status_update,
    :custom_field_settings,
    :custom_fields,
    :due_on,
    :followers,
    :gid,
    :html_notes,
    :is_workspace_level,
    :liked,
    :likes,
    :metric,
    :name,
    :notes,
    :num_likes,
    :owner,
    :resource_type,
    :start_on,
    :status,
    :team,
    :time_period,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      current_status_update: {Asana.Generated.GoalResponseCurrentStatusUpdate, :t},
      custom_field_settings: [{Asana.Generated.CustomFieldSettingResponse, :t}],
      custom_fields: [{Asana.Generated.CustomFieldCompact, :t}],
      due_on: :string,
      followers: [{Asana.Generated.UserCompact, :t}],
      gid: :string,
      html_notes: :string,
      is_workspace_level: :boolean,
      liked: :boolean,
      likes: [{Asana.Generated.Like, :t}],
      metric: {Asana.Generated.GoalResponseMetric, :t},
      name: :string,
      notes: :string,
      num_likes: :integer,
      owner: {Asana.Generated.GoalResponseOwner, :t},
      resource_type: :string,
      start_on: :string,
      status: :string,
      team: {Asana.Generated.GoalResponseTeam, :t},
      time_period: {Asana.Generated.GoalResponseTimePeriod, :t},
      workspace: {Asana.Generated.GoalResponseWorkspace, :t}
    ]
  end
end
