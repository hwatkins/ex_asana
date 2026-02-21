defmodule Asana.Generated.ProjectTemplateInstantiateProjectRequest do
  @moduledoc """
  Provides struct and type for a ProjectTemplateInstantiateProjectRequest
  """

  @type t :: %__MODULE__{
          is_strict: boolean | nil,
          name: String.t(),
          privacy_setting: String.t() | nil,
          public: boolean | nil,
          requested_dates: [Asana.Generated.DateVariableRequest.t()] | nil,
          requested_roles: [Asana.Generated.RequestedRoleRequest.t()] | nil,
          team: String.t() | nil
        }

  defstruct [
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
      requested_dates: [{Asana.Generated.DateVariableRequest, :t}],
      requested_roles: [{Asana.Generated.RequestedRoleRequest, :t}],
      team: :string
    ]
  end
end
