defmodule Insterra.Embeds.Node do
  use Ecto.Schema
  import Ecto.Changeset

  @derive Jason.Encoder

  @behaviour Insterra.Embeds.Behaviour

  @primary_key false
  embedded_schema do
    field(:id, :integer)
    field(:name, :string)
    field(:size, :string)
  end

  def changeset(node, attrs) do
    node
    |> cast(attrs, [:id, :name, :size])
    |> validate_required([:id, :name, :size])
  end

  def editable_fields do
    [:name, :size]
  end

  def sequence, do: :id

  def parse(attrs) when is_list(attrs) do
    Enum.map(attrs, &parse/1)
  end

  def parse(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> apply_action!(:insert)
  end
end
