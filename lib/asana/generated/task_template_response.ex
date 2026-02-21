defmodule Asana.Generated.TaskTemplateResponse do
  @moduledoc """
  Provides struct and type for a TaskTemplateResponse
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          created_by: Asana.Generated.TaskTemplateResponseCreatedBy.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          project: Asana.Generated.TaskTemplateResponseProject.t() | nil,
          resource_type: String.t() | nil,
          template: Asana.Generated.TaskTemplateResponseTemplate.t() | nil
        }

  defstruct [:created_at, :created_by, :gid, :name, :project, :resource_type, :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      created_by: {Asana.Generated.TaskTemplateResponseCreatedBy, :t},
      gid: :string,
      name: :string,
      project: {Asana.Generated.TaskTemplateResponseProject, :t},
      resource_type: :string,
      template: {Asana.Generated.TaskTemplateResponseTemplate, :t}
    ]
  end
end
