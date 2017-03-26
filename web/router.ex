defmodule Reassurance.Router do
  use Reassurance.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Reassurance do
    pipe_through :api
  end
end
