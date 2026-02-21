defmodule Asana.User.Base do
  @moduledoc """
  Provides struct and type for a User.Base
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          email: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          photo: Asana.User.BasePhoto.response() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :email, :gid, :name, :photo, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      email: {:string, "email"},
      gid: :string,
      name: :string,
      photo: {Asana.User.BasePhoto, :response},
      resource_type: :string
    ]
  end
end
