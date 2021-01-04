defmodule Niflheim.Repo do
  use Ecto.Repo,
    otp_app: :niflheim,
    adapter: Ecto.Adapters.Postgres
end
