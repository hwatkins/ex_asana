defmodule Asana.TaskSchemaTest do
  use ExUnit.Case, async: true

  test "task response fields include inherited allOf fields" do
    fields = Asana.Task.__fields__(:response)
    keys = Keyword.keys(fields)

    assert length(fields) >= 40
    assert :gid in keys
    assert :name in keys
    assert :assigned_by in keys
    assert :created_by in keys
    assert :completed_by in keys
    assert :external in keys
    assert :memberships in keys
    assert :likes in keys
    assert :dependencies in keys
    assert :dependents in keys
  end
end
