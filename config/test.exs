use Mix.Config


config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :openuni_api, OpenuniApi.Endpoint,
  http: [port: 3001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :openuni_api, OpenuniApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "dev",
  password: "dev",
  database: "openuni_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
