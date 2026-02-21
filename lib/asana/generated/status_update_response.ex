defmodule Asana.Generated.StatusUpdateResponse do
  @moduledoc """
  Provides struct and type for a StatusUpdateResponse
  """

  @type t :: %__MODULE__{
          author: Asana.Generated.UserCompact.t() | nil,
          created_at: DateTime.t() | nil,
          created_by: Asana.Generated.UserCompact.t() | nil,
          gid: String.t() | nil,
          hearted: boolean | nil,
          hearts: [Asana.Generated.Like.t()] | nil,
          html_text: String.t() | nil,
          liked: boolean | nil,
          likes: [Asana.Generated.Like.t()] | nil,
          modified_at: DateTime.t() | nil,
          num_hearts: integer | nil,
          num_likes: integer | nil,
          parent: Asana.Generated.StatusUpdateResponseParent.t() | nil,
          reaction_summary: [Asana.Generated.ReactionSummaryItemCompact.t()] | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          status_type: String.t(),
          text: String.t(),
          title: String.t() | nil
        }

  defstruct [
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
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {Asana.Generated.UserCompact, :t},
      created_at: {:string, "date-time"},
      created_by: {Asana.Generated.UserCompact, :t},
      gid: :string,
      hearted: :boolean,
      hearts: [{Asana.Generated.Like, :t}],
      html_text: :string,
      liked: :boolean,
      likes: [{Asana.Generated.Like, :t}],
      modified_at: {:string, "date-time"},
      num_hearts: :integer,
      num_likes: :integer,
      parent: {Asana.Generated.StatusUpdateResponseParent, :t},
      reaction_summary: [{Asana.Generated.ReactionSummaryItemCompact, :t}],
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
