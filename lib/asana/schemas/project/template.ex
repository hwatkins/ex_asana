defmodule Asana.Project.Template do
  @moduledoc """
  Provides struct and types for a Project.Template
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
          color: String.t() | nil,
          description: String.t() | nil,
          gid: String.t() | nil,
          html_description: String.t() | nil,
          name: String.t() | nil,
          owner: Asana.Project.TemplateOwner.response() | nil,
          public: boolean | nil,
          requested_dates: [Asana.DateVariable.compact()] | nil,
          requested_roles: [Asana.TemplateRole.t()] | nil,
          resource_type: String.t() | nil,
          team: Asana.Project.TemplateTeam.response() | nil
        }

  defstruct [
    :__info__,
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
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_type: :string]
  end

  def __fields__(:response) do
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
      owner: {Asana.Project.TemplateOwner, :response},
      public: :boolean,
      requested_dates: [{Asana.DateVariable, :compact}],
      requested_roles: [{Asana.TemplateRole, :t}],
      resource_type: :string,
      team: {Asana.Project.TemplateTeam, :response}
    ]
  end
end
