defmodule Asana.Generated.PlaceholderRateCompact do
  @moduledoc """
  Provides struct and type for a PlaceholderRateCompact
  """

  @type t :: %__MODULE__{
          created_by: Asana.Generated.UserCompact.t() | nil,
          currency_code: String.t() | nil,
          gid: String.t() | nil,
          parent: Asana.Generated.ProjectCompact.t() | nil,
          rate: number | nil,
          resource: Asana.Generated.PlaceholderCompact.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:created_by, :currency_code, :gid, :parent, :rate, :resource, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_by: {Asana.Generated.UserCompact, :t},
      currency_code: :string,
      gid: :string,
      parent: {Asana.Generated.ProjectCompact, :t},
      rate: :number,
      resource: {Asana.Generated.PlaceholderCompact, :t},
      resource_type: :string
    ]
  end
end
