defmodule Insterra.Bridge.Instellar.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive Jason.Encoder

  @primary_key false
  embedded_schema do
    field(:id, :integer)
    field(:username, :string)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id, :username])
    |> validate_required([:id, :username])
  end

  def create(params) do
    %__MODULE__{}
    |> changeset(params)
    |> apply_action(:insert)
  end
end
