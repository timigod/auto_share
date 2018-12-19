defmodule AutoShareWeb.Router do
  use AutoShareWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AutoShareWeb do
    pipe_through :api
  end
end
