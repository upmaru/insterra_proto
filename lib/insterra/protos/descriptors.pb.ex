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
  field(:category_id, 3, type: :int32)
  field(:parameters, 4, repeated: true, type: Insterra.Protos.Descriptors.Parameter)
end

defmodule Insterra.Protos.Descriptors.Variable.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:stack_id, 1, type: :int32, json_name: "stackId")
end

defmodule Insterra.Protos.Descriptors.Variable do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:key, 1, type: :string)
  field(:description, 2, type: :string)
  field(:generator, 3, type: :string)
end

defmodule Insterra.Protos.Descriptors.Parameter.Correlation do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:with_parameter_key, 1, type: :string)
  field(:with_parameter_block_id, 2, type: :int32)
end

defmodule Insterra.Protos.Descriptors.Parameter.Module do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:version, 2, type: :string)
  field(:provider, 3, type: :string)
end

defmodule Insterra.Protos.Descriptors.Parameter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:key, 1, type: :string)
  field(:type, 2, type: Insterra.Protos.Descriptors.Parameter.Type, enum: true)
  field(:singleton, 3, type: :bool)
  field(:module, 4, type: Insterra.Protos.Descriptors.Parameter.Module)

  field(:reference_from_parameters, 5, repeated: true, type: Insterra.Protos.Descriptors.Parameter)

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

  rpc(
    :ListVariables,
    Insterra.Protos.Descriptors.Variable.ListRequest,
    stream(Insterra.Protos.Descriptors.Variable)
  )
end

defmodule Insterra.Protos.Descriptors.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Descriptors.Handler.Service
end
