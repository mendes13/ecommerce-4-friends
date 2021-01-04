# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :niflheim,
  ecto_repos: [Niflheim.Repo]

# Configures the endpoint
config :niflheim, NiflheimWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s/oy4b5UwbeePErrRzi9FFpmULu8v4ot1e/dHczfffvkrMAtiICmDrZGVu3EYP5e",
  render_errors: [view: NiflheimWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Niflheim.PubSub,
  live_view: [signing_salt: "wpS2QkB0"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
