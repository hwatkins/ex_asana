defmodule Asana.Event do
  @moduledoc """
  Provides struct and type for a Event
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          action: String.t() | nil,
          change: Asana.Event.Change.response() | nil,
          created_at: DateTime.t() | nil,
          parent: Asana.Event.Parent.response() | nil,
          resource: Asana.Event.Resource.response() | nil,
          type: String.t() | nil,
          user: Asana.Event.User.response() | nil
        }

  defstruct [:__info__, :action, :change, :created_at, :parent, :resource, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      action: :string,
      change: {Asana.Event.Change, :response},
      created_at: {:string, "date-time"},
      parent: {Asana.Event.Parent, :response},
      resource: {Asana.Event.Resource, :response},
      type: :string,
      user: {Asana.Event.User, :response}
    ]
  end
end
