defmodule Insterra.Protos.Configurations.Draft do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:stack_id, 1, type: :int32)
  field(:original, 2, type: :bool)
end

defmodule Insterra.Protos.Configurations.Archive.Response do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 3, type: Insterra.Protos.Configurations.Archive)
end

defmodule Insterra.Protos.Configurations.Archive.File do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:content, 2, type: :string)
end

defmodule Insterra.Protos.Configurations.Archive do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :string)
  field(:files, 2, repeated: true, type: Insterra.Protos.Configurations.Archive.File)
end

defmodule Insterra.Protos.Configurations.Handler.Service do
  @moduledoc false

  use GRPC.Service,
    name: "insterra.protos.configurations.Handler",
    protoc_gen_elixir_version: "0.12.0"

  rpc(:Prepare, Insterra.Protos.Configurations.Draft, stream(Insterra.Protos.Descriptors.Block))

  rpc(
    :Create,
    Insterra.Protos.Configurations.Draft,
    Insterra.Protos.Configurations.Archive.Response
  )
end

defmodule Insterra.Protos.Configurations.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Configurations.Handler.Service
end
