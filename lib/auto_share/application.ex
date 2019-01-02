defmodule AutoShare.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      AutoShare.Repo,
      # Start the endpoint when the application starts
      AutoShareWeb.Endpoint,
      # Starts a worker by calling: AutoShare.Worker.start_link(arg)
      # {AutoShare.Worker, arg},
      worker(AutoShare.Scheduler, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AutoShare.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AutoShareWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
