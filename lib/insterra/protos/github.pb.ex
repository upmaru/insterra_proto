defmodule Insterra.Protos.Github.Repository.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
end

defmodule Insterra.Protos.Github.Repository.GetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:stack_id, 2, type: :int32)
end

defmodule Insterra.Protos.Github.Repository.CreateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:instellar_github_installation_id, 3, type: :int32)
  field(:instellar_github_installation_type, 4, type: :string)
  field(:stack_id, 5, type: :int32)
  field(:name, 6, type: :string)
  field(:encrypted_token, 7, type: Insterra.Protos.Credentials.Token, json_name: "encryptedToken")

  field(:personal_encrypted_token, 8,
    type: Insterra.Protos.Credentials.Token,
    json_name: "personalEncryptedToken"
  )
end

defmodule Insterra.Protos.Github.Repository.TransitionRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:id, 3, type: :int32)
  field(:event, 4, type: Insterra.Protos.Transitions.Event)
  field(:encrypted_token, 5, type: Insterra.Protos.Credentials.Token)
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
  field(:uid, 3, type: :int32)
  field(:current_state, 4, type: :string)
end

defmodule Insterra.Protos.Github.Handler.Service do
  @moduledoc false

  use GRPC.Service, name: "insterra.protos.github.Handler", protoc_gen_elixir_version: "0.12.0"

  rpc(
    :ListRepositories,
    Insterra.Protos.Github.Repository.ListRequest,
    stream(Insterra.Protos.Github.Repository)
  )

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
