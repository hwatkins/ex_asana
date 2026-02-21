defmodule Asana.Project.UpdateRequestCurrentStatus do
  @moduledoc """
  Provides struct and type for a Project.UpdateRequestCurrentStatus
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          author: Asana.User.compact() | nil,
          color: String.t() | nil,
          created_at: DateTime.t() | nil,
          created_by: Asana.User.compact() | nil,
          gid: String.t() | nil,
          html_text: String.t() | nil,
          modified_at: DateTime.t() | nil,
          resource_type: String.t() | nil,
          text: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [
    :__info__,
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
      author: {Asana.User, :compact},
      color: {:enum, ["green", "yellow", "red", "blue", "complete"]},
      created_at: {:string, "date-time"},
      created_by: {Asana.User, :compact},
      gid: :string,
      html_text: :string,
      modified_at: {:string, "date-time"},
      resource_type: :string,
      text: :string,
      title: :string
    ]
  end
end
