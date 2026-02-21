defmodule Asana.Preview do
  @moduledoc """
  Provides struct and type for a Preview
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          fallback: String.t() | nil,
          footer: String.t() | nil,
          header: String.t() | nil,
          header_link: String.t() | nil,
          html_text: String.t() | nil,
          text: String.t() | nil,
          title: String.t() | nil,
          title_link: String.t() | nil
        }

  defstruct [
    :__info__,
    :fallback,
    :footer,
    :header,
    :header_link,
    :html_text,
    :text,
    :title,
    :title_link
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fallback: :string,
      footer: :string,
      header: :string,
      header_link: :string,
      html_text: :string,
      text: :string,
      title: :string,
      title_link: :string
    ]
  end
end
