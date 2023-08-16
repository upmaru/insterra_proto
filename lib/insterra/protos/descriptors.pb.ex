defmodule Insterra.Protos.Descriptors.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:provider, 0)
  field(:module, 1)
  field(:map, 2)
end

defmodule Insterra.Protos.Descriptors.Block do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:type, 2, type: Insterra.Protos.Descriptors.Type, enum: true)
  field(:category_id, 3, type: :int32, json_name: "categoryId")
  field(:provider, 4, type: Insterra.Protos.Platforms.Provider)
end
