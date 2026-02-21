defmodule Asana.TimePeriod do
  @moduledoc """
  Provides struct and types for a TimePeriod
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          display_name: String.t() | nil,
          end_on: String.t() | nil,
          gid: String.t() | nil,
          period: String.t() | nil,
          resource_type: String.t() | nil,
          start_on: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          display_name: String.t() | nil,
          end_on: String.t() | nil,
          gid: String.t() | nil,
          parent: Asana.TimePeriod.Parent.response() | nil,
          period: String.t() | nil,
          resource_type: String.t() | nil,
          start_on: String.t() | nil
        }

  defstruct [:__info__, :display_name, :end_on, :gid, :parent, :period, :resource_type, :start_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      display_name: :string,
      end_on: :string,
      gid: :string,
      period: {:enum, ["FY", "H1", "H2", "Q1", "Q2", "Q3", "Q4"]},
      resource_type: :string,
      start_on: :string
    ]
  end

  def __fields__(:response) do
    [
      display_name: :string,
      end_on: :string,
      gid: :string,
      parent: {Asana.TimePeriod.Parent, :response},
      period: {:enum, ["FY", "H1", "H2", "Q1", "Q2", "Q3", "Q4"]},
      resource_type: :string,
      start_on: :string
    ]
  end
end
