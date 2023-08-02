defmodule Insterra.Protos.Descriptors.Block do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:type, 2, type: :string)
  field(:category_id, 3, type: :int32, json_name: "categoryId")
end
