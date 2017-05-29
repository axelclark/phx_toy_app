defmodule PhxToyApp.Web.Router do
  use PhxToyApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxToyApp.Web do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController
    resources "/microposts", MicropostController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxToyApp.Web do
  #   pipe_through :api
  # end
end
