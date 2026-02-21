defmodule Asana.StatusUpdate do
  @moduledoc """
  Provides struct and types for a StatusUpdate
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          title: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          author: Asana.User.compact() | nil,
          created_at: DateTime.t() | nil,
          created_by: Asana.User.compact() | nil,
          gid: String.t() | nil,
          hearted: boolean | nil,
          hearts: [Asana.Like.t()] | nil,
          html_text: String.t() | nil,
          liked: boolean | nil,
          likes: [Asana.Like.t()] | nil,
          modified_at: DateTime.t() | nil,
          num_hearts: integer | nil,
          num_likes: integer | nil,
          parent: Asana.StatusUpdate.Parent.response() | nil,
          reaction_summary: [Asana.Reaction.SummaryItem.compact()] | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          status_type: String.t(),
          text: String.t(),
          title: String.t() | nil
        }

  defstruct [
    :__info__,
    :author,
    :created_at,
    :created_by,
    :gid,
    :hearted,
    :hearts,
    :html_text,
    :liked,
    :likes,
    :modified_at,
    :num_hearts,
    :num_likes,
    :parent,
    :reaction_summary,
    :resource_subtype,
    :resource_type,
    :status_type,
    :text,
    :title
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      gid: :string,
      resource_subtype:
        {:enum, ["project_status_update", "portfolio_status_update", "goal_status_update"]},
      resource_type: :string,
      title: :string
    ]
  end

  def __fields__(:response) do
    [
      author: {Asana.User, :compact},
      created_at: {:string, "date-time"},
      created_by: {Asana.User, :compact},
      gid: :string,
      hearted: :boolean,
      hearts: [{Asana.Like, :t}],
      html_text: :string,
      liked: :boolean,
      likes: [{Asana.Like, :t}],
      modified_at: {:string, "date-time"},
      num_hearts: :integer,
      num_likes: :integer,
      parent: {Asana.StatusUpdate.Parent, :response},
      reaction_summary: [{Asana.Reaction.SummaryItem, :compact}],
      resource_subtype:
        {:enum, ["project_status_update", "portfolio_status_update", "goal_status_update"]},
      resource_type: :string,
      status_type:
        {:enum,
         [
           "on_track",
           "at_risk",
           "off_track",
           "on_hold",
           "complete",
           "achieved",
           "partial",
           "missed",
           "dropped"
         ]},
      text: :string,
      title: :string
    ]
  end
end
