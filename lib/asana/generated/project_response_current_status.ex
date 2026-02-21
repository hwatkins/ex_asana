defmodule Asana.Generated.ProjectResponseCurrentStatus do
  @moduledoc """
  Provides struct and type for a ProjectResponseCurrentStatus
  """

  @type t :: %__MODULE__{
          author: Asana.Generated.UserCompact.t() | nil,
          color: String.t() | nil,
          created_at: DateTime.t() | nil,
          created_by: Asana.Generated.UserCompact.t() | nil,
          gid: String.t() | nil,
          html_text: String.t() | nil,
          modified_at: DateTime.t() | nil,
          resource_type: String.t() | nil,
          text: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [
    :author,
    :color,
    :created_at,
    :created_by,
    :gid,
    :html_text,
    :modified_at,
    :resource_type,
    :text,
    :title
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {Asana.Generated.UserCompact, :t},
      color: {:enum, ["green", "yellow", "red", "blue", "complete"]},
      created_at: {:string, "date-time"},
      created_by: {Asana.Generated.UserCompact, :t},
      gid: :string,
      html_text: :string,
      modified_at: {:string, "date-time"},
      resource_type: :string,
      text: :string,
      title: :string
    ]
  end
end
