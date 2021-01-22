defmodule Niflheim.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :total, :integer, null: false
      add :status, :string, null: false

      timestamps()
    end

  end
end
