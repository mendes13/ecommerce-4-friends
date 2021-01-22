defmodule Niflheim.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Niflheim.Orders

  schema "orders" do
    field :total, :integer
    field :status, Ecto.Enum, values: [:pending, :finished]
    has_many :items, Orders.Item

    timestamps()
  end

  @doc false
  def new_changeset(order, attrs) do
    order
    |> cast(attrs, [:status, :total])
    |> cast_assoc(:items, with: &items_changeset/2)
    |> update_order_total
    |> put_change(:status, :pending)
  end

  def update_status_changeset(order, status) do
    order
    |> cast(%{"status" => status}, [:status])
    |> validate_required([:status])
    |> put_change(:status, String.to_atom(status))
  end

  defp items_changeset(order_item, attrs) do
    order_item
    |> cast(attrs, [:title, :price, :image, :quantity, :product_id])
    |> validate_required([:title, :price, :image, :quantity, :product_id])
  end

  defp update_order_total(order) do
    put_change(order, :total, calculate_total(order))
  end

  defp calculate_total(order) do
    order
    |> get_change(:items)
    |> Enum.reduce(0, fn (item, acc) -> acc + Orders.Item.total(item) end)
  end
end
