defmodule NiflheimWeb.API.OrderStatusController do
  use NiflheimWeb, :controller

  alias Niflheim.Orders
  alias Niflheim.Orders.Order

  action_fallback NiflheimWeb.FallbackController

  def update(conn, %{"id" => id, "data" => %{"status" => status}}) do
    order = Orders.get_order!(id)

    with {:ok, %Order{} = order} <- Orders.update_status(order, status) do
      render(conn, "show.json", order: order)
    end
  end
end
