defmodule Insterra.Protos.Accounts.OrganizationReference do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:provider, 1, type: :string)
  field(:uid, 2, type: :string)
end

defmodule Insterra.Protos.Accounts.UserReference do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:provider, 1, type: :string)
  field(:uid, 2, type: :string)
end

defmodule Insterra.Protos.Accounts.Organization.Registration do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:name, 1, type: :string)
  field(:provider, 2, type: :string)
  field(:uid, 3, type: :string)
end

defmodule Insterra.Protos.Accounts.Organization.Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:status, 1, type: Insterra.Protos.Responses.Status)
end

defmodule Insterra.Protos.Accounts.Organization do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Insterra.Protos.Accounts.Handler.Service do
  @moduledoc false

  use GRPC.Service, name: "insterra.protos.accounts.Handler", protoc_gen_elixir_version: "0.12.0"

  rpc(
    :RegisterOrganization,
    Insterra.Protos.Accounts.Organization.Registration,
    Insterra.Protos.Accounts.Organization.Response
  )
end

defmodule Insterra.Protos.Accounts.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Accounts.Handler.Service
end
