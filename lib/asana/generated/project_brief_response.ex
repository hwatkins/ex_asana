defmodule Asana.Generated.ProjectBriefResponse do
  @moduledoc """
  Provides struct and type for a ProjectBriefResponse
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          html_text: String.t() | nil,
          permalink_url: String.t() | nil,
          project: Asana.Generated.ProjectBriefResponseProject.t() | nil,
          resource_type: String.t() | nil,
          text: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:gid, :html_text, :permalink_url, :project, :resource_type, :text, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      html_text: :string,
      permalink_url: :string,
      project: {Asana.Generated.ProjectBriefResponseProject, :t},
      resource_type: :string,
      text: :string,
      title: :string
    ]
  end
end
