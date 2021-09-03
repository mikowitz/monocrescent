defmodule Monocrescent.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Monocrescent.Repo,
      # Start the Telemetry supervisor
      MonocrescentWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Monocrescent.PubSub},
      # Start the Endpoint (http/https)
      MonocrescentWeb.Endpoint
      # Start a worker by calling: Monocrescent.Worker.start_link(arg)
      # {Monocrescent.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Monocrescent.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MonocrescentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
