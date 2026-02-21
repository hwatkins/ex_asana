defmodule Asana.Generated.ProjectSaveAsTemplateRequest do
  @moduledoc """
  Provides struct and type for a ProjectSaveAsTemplateRequest
  """

  @type t :: %__MODULE__{
          name: String.t(),
          public: boolean,
          team: String.t() | nil,
          workspace: String.t() | nil
        }

  defstruct [:name, :public, :team, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: :string, public: :boolean, team: :string, workspace: :string]
  end
end
