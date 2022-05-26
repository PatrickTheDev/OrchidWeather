import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :orchid_weather, OrchidWeather.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "orchid_weather_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :orchid_weather, OrchidWeatherWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ACM/YHANGpzw6Y+Bk7bz+AA2TJYlJQh0DHxXeEoQMtC/uyuIpbNpPq+Ja80VMNvK",
  server: false

# In test we don't send emails.
config :orchid_weather, OrchidWeather.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
