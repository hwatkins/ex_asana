defmodule Asana.PlaceholderRate do
  @moduledoc """
  Provides struct and type for a PlaceholderRate
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          created_by: Asana.User.compact() | nil,
          currency_code: String.t() | nil,
          gid: String.t() | nil,
          parent: Asana.Project.compact() | nil,
          rate: number | nil,
          resource: Asana.Placeholder.compact() | nil,
          resource_type: String.t() | nil
        }

  defstruct [
    :__info__,
    :created_by,
    :currency_code,
    :gid,
    :parent,
    :rate,
    :resource,
    :resource_type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      created_by: {Asana.User, :compact},
      currency_code: :string,
      gid: :string,
      parent: {Asana.Project, :compact},
      rate: :number,
      resource: {Asana.Placeholder, :compact},
      resource_type: :string
    ]
  end
end
