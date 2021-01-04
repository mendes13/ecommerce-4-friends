defmodule NiflheimWeb.API.ProductController do
  use NiflheimWeb, :controller

  alias Niflheim.Products
  alias Niflheim.Products.Product

  action_fallback NiflheimWeb.FallbackController

  def index(conn, _params) do
    products = Products.list_products()
    render(conn, "index.json", products: products)
  end
end
