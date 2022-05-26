defmodule OrchidWeather.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      OrchidWeather.Repo,
      # Start the Telemetry supervisor
      OrchidWeatherWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: OrchidWeather.PubSub},
      # Start the Endpoint (http/https)
      OrchidWeatherWeb.Endpoint
      # Start a worker by calling: OrchidWeather.Worker.start_link(arg)
      # {OrchidWeather.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OrchidWeather.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OrchidWeatherWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
