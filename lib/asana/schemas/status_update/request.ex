defmodule Asana.StatusUpdate.Request do
  @moduledoc """
  Provides struct and type for a StatusUpdate.Request
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          html_text: String.t() | nil,
          parent: Asana.StatusUpdate.RequestParent.t(),
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          status_type: String.t(),
          text: String.t(),
          title: String.t() | nil
        }

  defstruct [
    :__info__,
    :gid,
    :html_text,
    :parent,
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
      gid: :string,
      html_text: :string,
      parent: {Asana.StatusUpdate.RequestParent, :t},
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
