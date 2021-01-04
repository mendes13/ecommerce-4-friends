defmodule Niflheim.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :image, :string
    field :price, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :image, :price])
    |> validate_required([:title, :image, :price])
    |> unique_constraint(:title)
  end
end
