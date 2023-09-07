defmodule Insterra.Protos.Github.Repository.Token do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:nonce_size, 1, type: :int32)
  field(:cipher, 2, type: :string)
end

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
  field(:instellar_github_installation_id, 3, type: :int32)
  field(:stack_id, 4, type: :int32, json_name: "stackId")
  field(:name, 5, type: :string)

  field(:encrypted_token, 6,
    type: Insterra.Protos.Github.Repository.Token,
    json_name: "encryptedToken"
  )
end

defmodule Insterra.Protos.Github.Repository.TransitionRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:id, 3, type: :int32)
  field(:event, 4, type: Insterra.Protos.Transitions.Event)

  field(:encrypted_token, 5,
    type: Insterra.Protos.Github.Repository.Token,
    json_name: "encryptedToken"
  )
end

defmodule Insterra.Protos.Github.Repository.Response do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 3, type: Insterra.Protos.Github.Repository)
end

defmodule Insterra.Protos.Github.Repository.Event do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:inserted_at, 3, type: :string)
  field(:resource, 4, type: Insterra.Protos.Github.Repository)
end

defmodule Insterra.Protos.Github.Repository do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:current_state, 3, type: :string)
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

  rpc(
    :TransitionRepository,
    Insterra.Protos.Github.Repository.TransitionRequest,
    Insterra.Protos.Github.Repository.Response
  )
end

defmodule Insterra.Protos.Github.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Github.Handler.Service
end
