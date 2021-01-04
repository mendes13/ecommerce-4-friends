defmodule NiflheimWeb.ProductController do
  use NiflheimWeb, :controller

  alias Niflheim.Products
  alias Niflheim.Products.Product

  def index(conn, _params) do
    products = Products.list_products()
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = Products.change_product(%Product{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    # filename = save_file(product_params["image"])
    # product_params = Map.put(product_params, "image", filename)

    case Products.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: Routes.product_path(conn, :show, product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp save_file(nil) do
    nil
  end

  defp save_file(file) do
    filename = "#{:os.system_time(:millisecond)}-#{file.filename}" 
    File.cp(file.path, "tmp/#{filename}")
    filename
  end

  def show(conn, %{"id" => id}) do
    product = Products.get_product!(id)
    render(conn, "show.html", product: product)
  end

  def edit(conn, %{"id" => id}) do
    product = Products.get_product!(id)
    changeset = Products.change_product(product)
    render(conn, "edit.html", product: product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Products.get_product!(id)

    # product_params = update_product_image(product_params)

    case Products.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: Routes.product_path(conn, :show, product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  defp update_product_image(%{"image" => image} = product_params) do
    filename = save_file(image)
    product_params = %{product_params | "image" => filename}
  end

  defp update_product_image(product_params) do
    product_params
  end

  def delete(conn, %{"id" => id}) do
    product = Products.get_product!(id)
    {:ok, _product} = Products.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: Routes.product_path(conn, :index))
  end
end
