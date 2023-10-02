defmodule Insterra.Protos.Credentials.Token do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:nonce_size, 1, type: :int32)
  field(:cipher, 2, type: :string)
end
