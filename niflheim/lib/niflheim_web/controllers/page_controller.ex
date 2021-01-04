defmodule NiflheimWeb.PageController do
  use NiflheimWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
