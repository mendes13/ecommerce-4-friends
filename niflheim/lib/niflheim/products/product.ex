defmodule Niflheim.Products.Product do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  alias Niflheim.Orders

  schema "products" do
    field :title, :string
    field :price, :integer
    field :image, Niflheim.ImageUploader.Type
    has_many :order_items, Orders.Item

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :price])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:title, :image, :price])
    |> unique_constraint(:title)
  end
end
