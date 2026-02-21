defmodule Asana.User.BasePhoto do
  @moduledoc """
  Provides struct and type for a User.BasePhoto
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          image_1024x1024: String.t() | nil,
          image_128x128: String.t() | nil,
          image_21x21: String.t() | nil,
          image_27x27: String.t() | nil,
          image_36x36: String.t() | nil,
          image_60x60: String.t() | nil
        }

  defstruct [
    :__info__,
    :image_1024x1024,
    :image_128x128,
    :image_21x21,
    :image_27x27,
    :image_36x36,
    :image_60x60
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      image_1024x1024: {:string, "uri"},
      image_128x128: {:string, "uri"},
      image_21x21: {:string, "uri"},
      image_27x27: {:string, "uri"},
      image_36x36: {:string, "uri"},
      image_60x60: {:string, "uri"}
    ]
  end
end
