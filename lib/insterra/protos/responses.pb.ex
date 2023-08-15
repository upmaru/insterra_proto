defmodule Insterra.Protos.Responses.Code do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :OK, 0
  field :NOT_FOUND, 1
end