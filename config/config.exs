# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixirRocket,
  ecto_repos: [ElixirRocket.Repo]

# Configures the endpoint
config :elixirRocket, ElixirRocketWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PhQrA15hJYW6NlnujU+4TcFSWl53XGzPG74csHnfyjytKw+ULJyCAqLRKBA2pMTN",
  render_errors: [view: ElixirRocketWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ElixirRocket.PubSub,
  live_view: [signing_salt: "NN3k83O8"]

config :elixirRocket, ElixirRocket.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
