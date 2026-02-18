defmodule Asana.RequestBuilderTest do
  use ExUnit.Case, async: true

  alias Asana.RequestBuilder

  test "adds multipart file parameters" do
    request = RequestBuilder.add_param(%{}, :file, :file, "/tmp/example.txt")

    assert request.form_multipart == [{:file, {:file, "/tmp/example.txt"}}]
  end

  test "supports 5XX wildcard mapping" do
    response = %Req.Response{status: 503, body: %{"errors" => []}}

    assert {:ok, %Req.Response{status: 503}} =
             RequestBuilder.evaluate_response({:ok, response}, [{"5XX", false}])
  end

  test "decodes map response bodies into typed models" do
    response = %Req.Response{status: 200, body: %{"errors" => []}}

    assert {:ok, %Asana.Model.Error{errors: []}} =
             RequestBuilder.evaluate_response(
               {:ok, response},
               [{200, %Asana.Model.Error{}}, {:default, false}]
             )
  end
end
