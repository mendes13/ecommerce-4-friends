defmodule Niflheim.Repo.Migrations.CreateOrderItems do
  use Ecto.Migration

  def change do
    create table(:order_items) do
      add :title, :string
      add :price, :integer
      add :image, :string
      add :quantity, :integer
      add :product_id, references(:products, on_delete: :nothing)
      add :order_id, references(:orders, on_delete: :delete_all, null: false)

      timestamps()
    end

    create index(:order_items, [:product_id])
    create index(:order_items, [:order_id])
  end
end
