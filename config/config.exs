# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phx_toy_app,
  ecto_repos: [PhxToyApp.Repo]

# Configures the endpoint
config :phx_toy_app, PhxToyApp.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b/3adpSOX306vpozMD4B09tz5rYgljSgoR3YBwg2OKubX30BL0kpTcWwFY1Z1dDS",
  render_errors: [view: PhxToyApp.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxToyApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
