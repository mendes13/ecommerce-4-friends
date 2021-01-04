defmodule NiflheimWeb.API.ProductView do
  use NiflheimWeb, :view
  alias NiflheimWeb.API.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      title: product.title,
      # TODO: centralize this logic somewhere
      image: NiflheimWeb.Endpoint.url() <> Niflheim.ImageUploader.url({product.image, product})
    }
  end
end
