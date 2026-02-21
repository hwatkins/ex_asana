defmodule Asana.Project.Brief do
  @moduledoc """
  Provides struct and type for a Project.Brief
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          html_text: String.t() | nil,
          permalink_url: String.t() | nil,
          project: Asana.Project.BriefProject.response() | nil,
          resource_type: String.t() | nil,
          text: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:__info__, :gid, :html_text, :permalink_url, :project, :resource_type, :text, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      gid: :string,
      html_text: :string,
      permalink_url: :string,
      project: {Asana.Project.BriefProject, :response},
      resource_type: :string,
      text: :string,
      title: :string
    ]
  end
end
