defmodule Insterra.Protos.Descriptors.Block.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:provider, 0)
  field(:module, 1)
  field(:map, 2)
end

defmodule Insterra.Protos.Descriptors.Parameter.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:value, 0)
  field(:reference, 1)
  field(:embed, 2)
  field(:variable, 3)
end

defmodule Insterra.Protos.Descriptors.Parameter.DataType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:integer, 0)
  field(:string, 1)
  field(:boolean, 2)
end

defmodule Insterra.Protos.Descriptors.Block.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:ids, 1, repeated: true, type: :int32)
end

defmodule Insterra.Protos.Descriptors.Block do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:type, 2, type: Insterra.Protos.Descriptors.Block.Type, enum: true)
  field(:category_id, 3, type: :int32, json_name: "categoryId")
  field(:parameters, 4, repeated: true, type: Insterra.Protos.Descriptors.Parameter)
end

defmodule Insterra.Protos.Descriptors.Parameter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:key, 1, type: :string)
  field(:type, 2, type: Insterra.Protos.Descriptors.Parameter.Type, enum: true)

  field(:data_type, 3,
    type: Insterra.Protos.Descriptors.Parameter.DataType,
    json_name: "dataType",
    enum: true
  )

  field(:singleton, 4, type: :bool)
end

defmodule Insterra.Protos.Descriptors.Handler.Service do
  @moduledoc false

  use GRPC.Service,
    name: "insterra.protos.descriptors.Handler",
    protoc_gen_elixir_version: "0.12.0"

  rpc(
    :ListBlocks,
    Insterra.Protos.Descriptors.Block.ListRequest,
    stream(Insterra.Protos.Descriptors.Block)
  )
end

defmodule Insterra.Protos.Descriptors.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Descriptors.Handler.Service
end
