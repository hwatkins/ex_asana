defmodule Asana.Generated.StoryRequest do
  @moduledoc """
  Provides struct and type for a StoryRequest
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          gid: String.t() | nil,
          html_text: String.t() | nil,
          is_pinned: boolean | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          sticker_name: String.t() | nil,
          text: String.t() | nil
        }

  defstruct [
    :created_at,
    :gid,
    :html_text,
    :is_pinned,
    :resource_subtype,
    :resource_type,
    :sticker_name,
    :text
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      gid: :string,
      html_text: :string,
      is_pinned: :boolean,
      resource_subtype: :string,
      resource_type: :string,
      sticker_name:
        {:enum,
         [
           "green_checkmark",
           "people_dancing",
           "dancing_unicorn",
           "heart",
           "party_popper",
           "people_waving_flags",
           "splashing_narwhal",
           "trophy",
           "yeti_riding_unicorn",
           "celebrating_people",
           "determined_climbers",
           "phoenix_spreading_love"
         ]},
      text: :string
    ]
  end
end
