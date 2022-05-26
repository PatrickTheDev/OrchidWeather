defmodule OrchidWeather.Repo do
  use Ecto.Repo,
    otp_app: :orchid_weather,
    adapter: Ecto.Adapters.Postgres
end
