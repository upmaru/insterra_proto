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

  field(:reference, 0)
  field(:embed, 1)
  field(:variable, 2)
  field(:integer, 3)
  field(:string, 4)
  field(:boolean, 5)
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

defmodule Insterra.Protos.Descriptors.Parameter.Correlation do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:with_parameter_key, 1, type: :string, json_name: "withParameterKey")
  field(:with_parameter_block_id, 2, type: :int32, json_name: "withParameterBlockId")
end

defmodule Insterra.Protos.Descriptors.Parameter.EmbedModule do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:provider, 2, type: :string)
end

defmodule Insterra.Protos.Descriptors.Parameter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:key, 1, type: :string)
  field(:type, 2, type: Insterra.Protos.Descriptors.Parameter.Type, enum: true)
  field(:singleton, 3, type: :bool)

  field(:embed_module, 4,
    type: Insterra.Protos.Descriptors.Parameter.EmbedModule,
    json_name: "embedModule"
  )

  field(:reference_from_parameters, 5,
    repeated: true,
    type: Insterra.Protos.Descriptors.Parameter,
    json_name: "referenceFromParameters"
  )

  field(:correlations, 6, repeated: true, type: Insterra.Protos.Descriptors.Parameter.Correlation)
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
