defmodule Asana do
  @moduledoc """
  Public entrypoint for constructing clients and issuing API requests.
  """

  alias Asana.Client

  @spec client(keyword()) :: Client.t()
  def client(opts \\ []), do: Client.new(opts)

  @spec request(Client.t(), keyword()) :: {:ok, term()} | {:error, Asana.Error.t()}
  def request(%Client{} = client, request_opts), do: Client.request(client, request_opts)
end
