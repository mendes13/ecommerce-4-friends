defmodule NiflheimWeb.API.OrderView do
  use NiflheimWeb, :view
  alias NiflheimWeb.API.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id,
      status: order.status,
      total: order.total}
  end
end
