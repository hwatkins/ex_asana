defmodule Asana.Generated.TimePeriodResponse do
  @moduledoc """
  Provides struct and type for a TimePeriodResponse
  """

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          end_on: String.t() | nil,
          gid: String.t() | nil,
          parent: Asana.Generated.TimePeriodResponseParent.t() | nil,
          period: String.t() | nil,
          resource_type: String.t() | nil,
          start_on: String.t() | nil
        }

  defstruct [:display_name, :end_on, :gid, :parent, :period, :resource_type, :start_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_name: :string,
      end_on: :string,
      gid: :string,
      parent: {Asana.Generated.TimePeriodResponseParent, :t},
      period: {:enum, ["FY", "H1", "H2", "Q1", "Q2", "Q3", "Q4"]},
      resource_type: :string,
      start_on: :string
    ]
  end
end
