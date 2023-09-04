defmodule Insterra.Protos.Github.Repository.GetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:stack_id, 2, type: :int32, json_name: "stackId")
end

defmodule Insterra.Protos.Github.Repository.CreateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:stack_id, 3, type: :int32, json_name: "stackId")
end

defmodule Insterra.Protos.Github.Repository.Response do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 3, type: Insterra.Protos.Github.Repository)
end

defmodule Insterra.Protos.Github.Repository do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
end

defmodule Insterra.Protos.Github.Handler.Service do
  @moduledoc false

  use GRPC.Service, name: "insterra.protos.github.Handler", protoc_gen_elixir_version: "0.12.0"

  rpc(
    :GetRepository,
    Insterra.Protos.Github.Repository.GetRequest,
    Insterra.Protos.Github.Repository.Response
  )

  rpc(
    :CreateRepository,
    Insterra.Protos.Github.Repository.CreateRequest,
    Insterra.Protos.Github.Repository.Response
  )
end

defmodule Insterra.Protos.Github.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Github.Handler.Service
end
