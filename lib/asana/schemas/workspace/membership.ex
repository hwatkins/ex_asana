defmodule Asana.Workspace.Membership do
  @moduledoc """
  Provides struct and types for a Workspace.Membership
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          resource_type: String.t() | nil,
          user: Asana.User.compact() | nil,
          workspace: Asana.Workspace.compact() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t() | nil,
          gid: String.t() | nil,
          is_active: boolean | nil,
          is_admin: boolean | nil,
          is_guest: boolean | nil,
          is_view_only: boolean | nil,
          resource_type: String.t() | nil,
          user: Asana.User.compact() | nil,
          user_task_list: Asana.User.TaskList.response() | nil,
          vacation_dates: Asana.Workspace.MembershipVacationDates.response() | nil,
          workspace: Asana.Workspace.compact() | nil
        }

  defstruct [
    :__info__,
    :created_at,
    :gid,
    :is_active,
    :is_admin,
    :is_guest,
    :is_view_only,
    :resource_type,
    :user,
    :user_task_list,
    :vacation_dates,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      gid: :string,
      resource_type: :string,
      user: {Asana.User, :compact},
      workspace: {Asana.Workspace, :compact}
    ]
  end

  def __fields__(:response) do
    [
      created_at: {:string, "date-time"},
      gid: :string,
      is_active: :boolean,
      is_admin: :boolean,
      is_guest: :boolean,
      is_view_only: :boolean,
      resource_type: :string,
      user: {Asana.User, :compact},
      user_task_list: {Asana.User.TaskList, :response},
      vacation_dates: {Asana.Workspace.MembershipVacationDates, :response},
      workspace: {Asana.Workspace, :compact}
    ]
  end
end
