defmodule Asana.Webhook.Signature do
  @moduledoc """
  Helpers for Asana webhook signature generation and verification.
  """

  import Bitwise

  @spec sign(String.t(), binary()) :: String.t()
  def sign(secret, body) when is_binary(secret) and is_binary(body) do
    :crypto.mac(:hmac, :sha256, secret, body)
    |> Base.encode16(case: :lower)
  end

  @spec valid?(String.t(), String.t(), binary()) :: boolean()
  def valid?(signature, secret, body)
      when is_binary(signature) and is_binary(secret) and is_binary(body) do
    expected = sign(secret, body)
    normalized = String.downcase(signature)

    byte_size(normalized) == byte_size(expected) and
      secure_compare(normalized, expected)
  end

  def valid?(_, _, _), do: false

  defp secure_compare(left, right) when byte_size(left) == byte_size(right) do
    left
    |> :binary.bin_to_list()
    |> Enum.zip(:binary.bin_to_list(right))
    |> Enum.reduce(0, fn {l, r}, acc -> acc ||| bxor(l, r) end)
    |> Kernel.==(0)
  end
end
