defmodule Insterra.Proto.Configurations.Archive.CreateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :stack_id, 1, type: :int32
end

defmodule Insterra.Proto.Configurations.Archive.File do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string
  field :content, 2, type: :string
end

defmodule Insterra.Proto.Configurations.Archive do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: :int32
  field :files, 2, repeated: true, type: Insterra.Proto.Configurations.Archive.File
end

defmodule Insterra.Proto.Configurations.Handler.Service do
  @moduledoc false

  use GRPC.Service,
    name: "insterra.proto.configurations.Handler",
    protoc_gen_elixir_version: "0.12.0"

  rpc :Create,
      Insterra.Proto.Configurations.Archive.CreateRequest,
      Insterra.Proto.Configurations.Archive
end

defmodule Insterra.Proto.Configurations.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Proto.Configurations.Handler.Service
end
