defmodule Asana.ClientTest do
  use ExUnit.Case, async: true

  describe "decode/2" do
    test "decodes a map into a typed struct" do
      input = %{"gid" => "123", "name" => "My Task", "resource_type" => "task"}

      result = Asana.Client.decode(input, {Asana.Task, :compact})

      assert %Asana.Task{} = result
      assert result.gid == "123"
      assert result.name == "My Task"
      assert result.resource_type == "task"
    end

    test "stores unknown fields in __info__" do
      input = %{
        "gid" => "123",
        "name" => "My Task",
        "unknown_field" => "some value"
      }

      result = Asana.Client.decode(input, {Asana.Task, :compact})

      assert result.gid == "123"
      assert result.__info__["unknown_field"] == "some value"
    end

    test "decodes nested structs using __fields__ type info" do
      input = %{
        "errors" => [
          %{"message" => "Not found", "help" => "Check the ID", "phrase" => "abc123"}
        ]
      }

      result = Asana.Client.decode(input, {Asana.Error, :response})

      assert %Asana.Error{} = result
      assert [%Asana.Error{} = error] = result.errors
      assert error.message == "Not found"
      assert error.help == "Check the ID"
      assert error.phrase == "abc123"
    end

    test "decodes lists of typed structs" do
      input = [
        %{"gid" => "1", "name" => "Task 1"},
        %{"gid" => "2", "name" => "Task 2"}
      ]

      result = Asana.Client.decode(input, [{Asana.Task, :compact}])

      assert [%Asana.Task{gid: "1"}, %Asana.Task{gid: "2"}] = result
    end

    test "handles nil values" do
      assert Asana.Client.decode(nil, {Asana.Task, :compact}) == nil
    end

    test "passes through primitive types" do
      assert Asana.Client.decode("hello", :string) == "hello"
      assert Asana.Client.decode(42, :integer) == 42
      assert Asana.Client.decode(true, :boolean) == true
    end

    test "populates struct fields from all merged variants" do
      # A response-level Task should still populate compact-level fields like gid, name
      input = %{
        "gid" => "123",
        "name" => "My Task",
        "assignee" => %{"gid" => "456", "name" => "Jane"}
      }

      result = Asana.Client.decode(input, {Asana.Task, :response})

      assert %Asana.Task{} = result
      assert result.gid == "123"
      assert result.name == "My Task"
      assert %Asana.Task.Assignee{} = result.assignee
      assert result.assignee.gid == "456"
    end
  end
end
