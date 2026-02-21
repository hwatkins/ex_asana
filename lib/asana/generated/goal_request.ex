defmodule Asana.Generated.GoalRequest do
  @moduledoc """
  Provides struct and type for a GoalRequest
  """

  @type t :: %__MODULE__{
          due_on: String.t() | nil,
          followers: [String.t()] | nil,
          gid: String.t() | nil,
          html_notes: String.t() | nil,
          is_workspace_level: boolean | nil,
          liked: boolean | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          owner: String.t() | nil,
          resource_type: String.t() | nil,
          start_on: String.t() | nil,
          team: String.t() | nil,
          time_period: String.t() | nil,
          workspace: String.t() | nil
        }

  defstruct [
    :due_on,
    :followers,
    :gid,
    :html_notes,
    :is_workspace_level,
    :liked,
    :name,
    :notes,
    :owner,
    :resource_type,
    :start_on,
    :team,
    :time_period,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      due_on: :string,
      followers: [:string],
      gid: :string,
      html_notes: :string,
      is_workspace_level: :boolean,
      liked: :boolean,
      name: :string,
      notes: :string,
      owner: :string,
      resource_type: :string,
      start_on: :string,
      team: :string,
      time_period: :string,
      workspace: :string
    ]
  end
end
