defmodule Asana.Generated.WorkspaceMembershipResponse do
  @moduledoc """
  Provides struct and type for a WorkspaceMembershipResponse
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          gid: String.t() | nil,
          is_active: boolean | nil,
          is_admin: boolean | nil,
          is_guest: boolean | nil,
          is_view_only: boolean | nil,
          resource_type: String.t() | nil,
          user: Asana.Generated.UserCompact.t() | nil,
          user_task_list: Asana.Generated.UserTaskListResponse.t() | nil,
          vacation_dates: Asana.Generated.WorkspaceMembershipResponseVacationDates.t() | nil,
          workspace: Asana.Generated.WorkspaceCompact.t() | nil
        }

  defstruct [
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
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      gid: :string,
      is_active: :boolean,
      is_admin: :boolean,
      is_guest: :boolean,
      is_view_only: :boolean,
      resource_type: :string,
      user: {Asana.Generated.UserCompact, :t},
      user_task_list: {Asana.Generated.UserTaskListResponse, :t},
      vacation_dates: {Asana.Generated.WorkspaceMembershipResponseVacationDates, :t},
      workspace: {Asana.Generated.WorkspaceCompact, :t}
    ]
  end
end
