defmodule Asana.Generated.EventResponse do
  @moduledoc """
  Provides struct and type for a EventResponse
  """

  @type t :: %__MODULE__{
          action: String.t() | nil,
          change: Asana.Generated.EventResponseChange.t() | nil,
          created_at: DateTime.t() | nil,
          parent: Asana.Generated.EventResponseParent.t() | nil,
          resource: Asana.Generated.EventResponseResource.t() | nil,
          type: String.t() | nil,
          user: Asana.Generated.EventResponseUser.t() | nil
        }

  defstruct [:action, :change, :created_at, :parent, :resource, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: :string,
      change: {Asana.Generated.EventResponseChange, :t},
      created_at: {:string, "date-time"},
      parent: {Asana.Generated.EventResponseParent, :t},
      resource: {Asana.Generated.EventResponseResource, :t},
      type: :string,
      user: {Asana.Generated.EventResponseUser, :t}
    ]
  end
end
