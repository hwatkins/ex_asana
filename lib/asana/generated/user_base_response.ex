defmodule Asana.Generated.UserBaseResponse do
  @moduledoc """
  Provides struct and type for a UserBaseResponse
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          photo: Asana.Generated.UserBaseResponsePhoto.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:email, :gid, :name, :photo, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, "email"},
      gid: :string,
      name: :string,
      photo: {Asana.Generated.UserBaseResponsePhoto, :t},
      resource_type: :string
    ]
  end
end
