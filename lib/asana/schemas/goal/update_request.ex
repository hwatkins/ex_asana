defmodule Asana.Goal.UpdateRequest do
  @moduledoc """
  Provides struct and type for a Goal.UpdateRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          custom_fields: map | nil,
          due_on: String.t() | nil,
          gid: String.t() | nil,
          html_notes: String.t() | nil,
          is_workspace_level: boolean | nil,
          liked: boolean | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          owner: String.t() | nil,
          resource_type: String.t() | nil,
          start_on: String.t() | nil,
          status: String.t() | nil,
          team: String.t() | nil,
          time_period: String.t() | nil,
          workspace: String.t() | nil
        }

  defstruct [
    :__info__,
    :custom_fields,
    :due_on,
    :gid,
    :html_notes,
    :is_workspace_level,
    :liked,
    :name,
    :notes,
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
      custom_fields: :map,
      due_on: :string,
      gid: :string,
      html_notes: :string,
      is_workspace_level: :boolean,
      liked: :boolean,
      name: :string,
      notes: :string,
      owner: :string,
      resource_type: :string,
      start_on: :string,
      status: :string,
      team: :string,
      time_period: :string,
      workspace: :string
    ]
  end
end
