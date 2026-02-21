defmodule Asana.Generated.ProjectTemplateResponse do
  @moduledoc """
  Provides struct and type for a ProjectTemplateResponse
  """

  @type t :: %__MODULE__{
          color: String.t() | nil,
          description: String.t() | nil,
          gid: String.t() | nil,
          html_description: String.t() | nil,
          name: String.t() | nil,
          owner: Asana.Generated.ProjectTemplateResponseOwner.t() | nil,
          public: boolean | nil,
          requested_dates: [Asana.Generated.DateVariableCompact.t()] | nil,
          requested_roles: [Asana.Generated.TemplateRole.t()] | nil,
          resource_type: String.t() | nil,
          team: Asana.Generated.ProjectTemplateResponseTeam.t() | nil
        }

  defstruct [
    :color,
    :description,
    :gid,
    :html_description,
    :name,
    :owner,
    :public,
    :requested_dates,
    :requested_roles,
    :resource_type,
    :team
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
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
           "light-warm-gray",
           nil
         ]},
      description: :string,
      gid: :string,
      html_description: :string,
      name: :string,
      owner: {Asana.Generated.ProjectTemplateResponseOwner, :t},
      public: :boolean,
      requested_dates: [{Asana.Generated.DateVariableCompact, :t}],
      requested_roles: [{Asana.Generated.TemplateRole, :t}],
      resource_type: :string,
      team: {Asana.Generated.ProjectTemplateResponseTeam, :t}
    ]
  end
end
