defmodule Niflheim.Orders.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Niflheim.Products.Product
  alias Niflheim.Orders.Order

  schema "order_items" do
    field :image, :string
    field :price, :integer
    field :quantity, :integer
    field :title, :string
    belongs_to :product, Product
    belongs_to :order, Order

    timestamps()
  end

  def total(item) do
    get_change(item, :price) * get_change(item, :quantity)
  end
end
