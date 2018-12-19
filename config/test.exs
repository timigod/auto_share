use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :auto_share, AutoShareWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :auto_share, AutoShare.Repo,
  username: "postgres",
  password: "postgres",
  database: "auto_share_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
