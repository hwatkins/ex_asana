# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.Task do
  @moduledoc """
  The *task* is the basic object around which many operations in Asana are centered. In the Asana application, multiple tasks populate the middle pane according to some view parameters, and the set of selected tasks determines the more detailed information presented in the details pane.  A *section*, at its core, is a task whose name ends with the colon character `:`. Sections are unique in that they will be included in the *memberships* field of task objects returned in the API when the task is within a section. They can also be used to manipulate the ordering of a task within a project.  [Queries](https://asana.com/developers/api-reference/tasks#query) return a compact representation of each object which is typically the id and name fields. Interested in a specific set of fields or all of the fields? Use [field selectors](https://asana.com/developers/documentation/getting-started/input-output-options) to manipulate what data is included in a response.
  """

  @derive [Poison.Encoder]
  defstruct [
    :"assignee",
    :"assignee_status",
    :"completed",
    :"completed_at",
    :"custom_fields",
    :"dependencies",
    :"dependents",
    :"due_on",
    :"due_at",
    :"external",
    :"followers",
    :"html_notes",
    :"liked",
    :"likes",
    :"memberships",
    :"modified_at",
    :"name",
    :"notes",
    :"num_likes",
    :"num_subtasks",
    :"projects",
    :"parent",
    :"start_on",
    :"tags",
    :"workspace",
    :"id",
    :"gid",
    :"resource_type",
    :"created_at",
    :"resource_subtype"
  ]

  @type t :: %__MODULE__{
    :"assignee" => User | nil,
    :"assignee_status" => String.t | nil,
    :"completed" => boolean() | nil,
    :"completed_at" => DateTime.t | nil,
    :"custom_fields" => [Asana.Model.CustomField.t] | nil,
    :"dependencies" => [map()] | nil,
    :"dependents" => [map()] | nil,
    :"due_on" => Date.t | nil,
    :"due_at" => Date.t | nil,
    :"external" => map() | nil,
    :"followers" => [Asana.Model.UserCompact.t] | nil,
    :"html_notes" => String.t | nil,
    :"liked" => boolean() | nil,
    :"likes" => [Asana.Model.UserCompact.t] | nil,
    :"memberships" => [map()] | nil,
    :"modified_at" => DateTime.t | nil,
    :"name" => String.t | nil,
    :"notes" => String.t | nil,
    :"num_likes" => integer() | nil,
    :"num_subtasks" => integer() | nil,
    :"projects" => [Asana.Model.ProjectCompact.t] | nil,
    :"parent" => TaskCompact | nil,
    :"start_on" => Date.t | nil,
    :"tags" => [Asana.Model.Tag.t] | nil,
    :"workspace" => WorkspaceCompact | nil,
    :"id" => integer() | nil,
    :"gid" => integer() | nil,
    :"resource_type" => String.t | nil,
    :"created_at" => DateTime.t | nil,
    :"resource_subtype" => String.t | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.Task do
  import Asana.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"assignee", :struct, Asana.Model.User, options)
    |> deserialize(:"custom_fields", :list, Asana.Model.CustomField, options)
    |> deserialize(:"due_on", :date, nil, options)
    |> deserialize(:"due_at", :date, nil, options)
    |> deserialize(:"followers", :list, Asana.Model.UserCompact, options)
    |> deserialize(:"likes", :list, Asana.Model.UserCompact, options)
    |> deserialize(:"projects", :list, Asana.Model.ProjectCompact, options)
    |> deserialize(:"parent", :struct, Asana.Model.TaskCompact, options)
    |> deserialize(:"start_on", :date, nil, options)
    |> deserialize(:"tags", :list, Asana.Model.Tag, options)
    |> deserialize(:"workspace", :struct, Asana.Model.WorkspaceCompact, options)
  end
end
