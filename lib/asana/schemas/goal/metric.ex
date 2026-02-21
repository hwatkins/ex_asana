defmodule Asana.Goal.Metric do
  @moduledoc """
  Provides struct and type for a Goal.Metric
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          can_manage: boolean | nil,
          currency_code: String.t() | nil,
          current_display_value: String.t() | nil,
          current_number_value: number | nil,
          gid: String.t() | nil,
          initial_number_value: number | nil,
          is_custom_weight: boolean | nil,
          precision: integer | nil,
          progress_source: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          target_number_value: number | nil,
          unit: String.t() | nil
        }

  defstruct [
    :__info__,
    :can_manage,
    :currency_code,
    :current_display_value,
    :current_number_value,
    :gid,
    :initial_number_value,
    :is_custom_weight,
    :precision,
    :progress_source,
    :resource_subtype,
    :resource_type,
    :target_number_value,
    :unit
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      can_manage: :boolean,
      currency_code: :string,
      current_display_value: :string,
      current_number_value: :number,
      gid: :string,
      initial_number_value: :number,
      is_custom_weight: :boolean,
      precision: :integer,
      progress_source:
        {:enum,
         [
           "manual",
           "subgoal_progress",
           "project_task_completion",
           "project_milestone_completion",
           "task_completion",
           "external"
         ]},
      resource_subtype: {:const, "number"},
      resource_type: :string,
      target_number_value: :number,
      unit: {:enum, ["none", "currency", "percentage"]}
    ]
  end
end
