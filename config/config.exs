# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :openuni_api,
  ecto_repos: [OpenuniApi.Repo]

# Configures the endpoint
config :openuni_api, OpenuniApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "smfOYbsAEf0PheSazzpytiAFlUqLseeAmJPi6OSyunrOc9tJEx9KRgm2MUmI2x/h",
  render_errors: [view: OpenuniApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: OpenuniApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
