# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :monocrescent,
  ecto_repos: [Monocrescent.Repo]

# Configures the endpoint
config :monocrescent, MonocrescentWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hmQctbycPLn4DnYJoS/LC6amhLLgCD9DVlOTuLMG+ZmaEr33X8BdKvstNZM0Gd6W",
  render_errors: [view: MonocrescentWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Monocrescent.PubSub,
  live_view: [signing_salt: "7ICGoUwx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
