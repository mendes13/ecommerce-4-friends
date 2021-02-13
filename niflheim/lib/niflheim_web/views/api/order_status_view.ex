defmodule NiflheimWeb.API.OrderStatusView do
  use NiflheimWeb, :view
  alias NiflheimWeb.API.OrderView

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end
end
