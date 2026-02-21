defmodule Asana.Goal do
  @moduledoc """
  Provides struct and types for a Goal
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          owner: map | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          current_status_update: Asana.Goal.CurrentStatusUpdate.response() | nil,
          custom_field_settings: [Asana.CustomField.Setting.response()] | nil,
          custom_fields: [Asana.CustomField.compact()] | nil,
          due_on: String.t() | nil,
          followers: [Asana.User.compact()] | nil,
          gid: String.t() | nil,
          html_notes: String.t() | nil,
          is_workspace_level: boolean | nil,
          liked: boolean | nil,
          likes: [Asana.Like.t()] | nil,
          metric: Asana.Goal.Metric.response() | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          num_likes: integer | nil,
          owner: Asana.Goal.Owner.response() | nil,
          resource_type: String.t() | nil,
          start_on: String.t() | nil,
          status: String.t() | nil,
          team: Asana.Goal.Team.response() | nil,
          time_period: Asana.Goal.TimePeriod.response() | nil,
          workspace: Asana.Goal.Workspace.response() | nil
        }

  defstruct [
    :__info__,
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
  def __fields__(:compact) do
    [gid: :string, name: :string, owner: :map, resource_type: :string]
  end

  def __fields__(:response) do
    [
      current_status_update: {Asana.Goal.CurrentStatusUpdate, :response},
      custom_field_settings: [{Asana.CustomField.Setting, :response}],
      custom_fields: [{Asana.CustomField, :compact}],
      due_on: :string,
      followers: [{Asana.User, :compact}],
      gid: :string,
      html_notes: :string,
      is_workspace_level: :boolean,
      liked: :boolean,
      likes: [{Asana.Like, :t}],
      metric: {Asana.Goal.Metric, :response},
      name: :string,
      notes: :string,
      num_likes: :integer,
      owner: {Asana.Goal.Owner, :response},
      resource_type: :string,
      start_on: :string,
      status: :string,
      team: {Asana.Goal.Team, :response},
      time_period: {Asana.Goal.TimePeriod, :response},
      workspace: {Asana.Goal.Workspace, :response}
    ]
  end
end
