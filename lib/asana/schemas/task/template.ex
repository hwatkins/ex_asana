defmodule Asana.Task.Template do
  @moduledoc """
  Provides struct and types for a Task.Template
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
          created_at: DateTime.t() | nil,
          created_by: Asana.Task.TemplateCreatedBy.response() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          project: Asana.Task.TemplateProject.response() | nil,
          resource_type: String.t() | nil,
          template: Asana.Task.TemplateTemplate.response() | nil
        }

  defstruct [
    :__info__,
    :created_at,
    :created_by,
    :gid,
    :name,
    :project,
    :resource_type,
    :template
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_type: :string]
  end

  def __fields__(:response) do
    [
      created_at: {:string, "date-time"},
      created_by: {Asana.Task.TemplateCreatedBy, :response},
      gid: :string,
      name: :string,
      project: {Asana.Task.TemplateProject, :response},
      resource_type: :string,
      template: {Asana.Task.TemplateTemplate, :response}
    ]
  end
end
