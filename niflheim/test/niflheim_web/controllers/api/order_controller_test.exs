defmodule NiflheimWeb.API.OrderControllerTest do
  use NiflheimWeb.ConnCase

  alias Niflheim.Orders
  alias Niflheim.Orders.Order

  @create_attrs %{
    gross_value: 42,
    net_value: 42,
    total: 42
  }
  @update_attrs %{
    gross_value: 43,
    net_value: 43,
    total: 43
  }
  @invalid_attrs %{gross_value: nil, net_value: nil, total: nil}

  def fixture(:order) do
    {:ok, order} = Orders.create_order(@create_attrs)
    order
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all orders", %{conn: conn} do
      conn = get(conn, Routes.api_order_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create order" do
    test "renders order when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_order_path(conn, :create), order: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_order_path(conn, :show, id))

      assert %{
               "id" => id,
               "gross_value" => 42,
               "net_value" => 42,
               "total" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_order_path(conn, :create), order: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update order" do
    setup [:create_order]

    test "renders order when data is valid", %{conn: conn, order: %Order{id: id} = order} do
      conn = put(conn, Routes.api_order_path(conn, :update, order), order: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_order_path(conn, :show, id))

      assert %{
               "id" => id,
               "gross_value" => 43,
               "net_value" => 43,
               "total" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, order: order} do
      conn = put(conn, Routes.api_order_path(conn, :update, order), order: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete order" do
    setup [:create_order]

    test "deletes chosen order", %{conn: conn, order: order} do
      conn = delete(conn, Routes.api_order_path(conn, :delete, order))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_order_path(conn, :show, order))
      end
    end
  end

  defp create_order(_) do
    order = fixture(:order)
    %{order: order}
  end
end
