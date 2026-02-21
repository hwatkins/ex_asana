defmodule Asana.Project.Template.InstantiateProjectRequest do
  @moduledoc """
  Provides struct and type for a Project.Template.InstantiateProjectRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          is_strict: boolean | nil,
          name: String.t(),
          privacy_setting: String.t() | nil,
          public: boolean | nil,
          requested_dates: [Asana.DateVariable.Request.t()] | nil,
          requested_roles: [Asana.RequestedRoleRequest.t()] | nil,
          team: String.t() | nil
        }

  defstruct [
    :__info__,
    :is_strict,
    :name,
    :privacy_setting,
    :public,
    :requested_dates,
    :requested_roles,
    :team
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      is_strict: :boolean,
      name: :string,
      privacy_setting: {:enum, ["public_to_workspace", "private_to_team", "private"]},
      public: :boolean,
      requested_dates: [{Asana.DateVariable.Request, :t}],
      requested_roles: [{Asana.RequestedRoleRequest, :t}],
      team: :string
    ]
  end
end
