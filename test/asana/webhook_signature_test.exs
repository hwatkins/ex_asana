defmodule Asana.Webhook.SignatureTest do
  use ExUnit.Case, async: true

  alias Asana.Webhook.Signature

  test "sign/2 returns lowercase hex hmac sha256 digest" do
    digest = Signature.sign("secret", ~s({"events":[]}))

    assert byte_size(digest) == 64
    assert digest =~ ~r/\A[0-9a-f]{64}\z/
  end

  test "valid?/3 accepts matching digest and rejects mismatches" do
    body = ~s({"events":[{"gid":"1"}]})
    signature = Signature.sign("secret", body)

    assert Signature.valid?(signature, "secret", body)
    refute Signature.valid?(signature, "other-secret", body)
    refute Signature.valid?(signature, "secret", ~s({"events":[]}))
  end
end
