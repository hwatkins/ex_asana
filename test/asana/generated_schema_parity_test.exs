defmodule Asana.GeneratedSchemaParityTest do
  use ExUnit.Case, async: true
  alias Asana.Generated.TaskResponse

  test "generated task response includes inherited task fields" do
    fields = TaskResponse.__fields__(:t)
    keys = Keyword.keys(fields)

    assert length(fields) >= 40
    assert :gid in keys
    assert :name in keys
    assert :completed in keys
    assert :created_at in keys
    assert :modified_at in keys
    assert :memberships in keys
    assert :likes in keys
  end
end
