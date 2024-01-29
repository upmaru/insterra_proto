defmodule Insterra.Protos.Transitions.Event do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
  field(:parameters, 3, type: :bytes)
end
