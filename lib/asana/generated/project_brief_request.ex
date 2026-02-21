defmodule Asana.Generated.ProjectBriefRequest do
  @moduledoc """
  Provides struct and type for a ProjectBriefRequest
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          html_text: String.t() | nil,
          resource_type: String.t() | nil,
          text: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:gid, :html_text, :resource_type, :text, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, html_text: :string, resource_type: :string, text: :string, title: :string]
  end
end
