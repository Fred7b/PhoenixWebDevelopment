defmodule VocialWeb.Router do
  use VocialWeb, :router

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

  scope "/", VocialWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/polls", PollController, :index
    post "/polls", PollController, :create
    get "/polls/new", PollController, :new

    # get "/users/new", UserController, :new
    # get "/user/:id", UserController, :show
    # post "/users", UserController, :create

    # resources "/votes", PollController, only: [:index, :new, :create]
    resources "/users", UserController, only: [:new, :show, :create]

    resources "/sessions", SessionController, only: [:create]
    get "/login", SessionController, :new
    get "/logout", SessionController, :delete
    
  end

  # Other scopes may use custom stacks.
  # scope "/api", VocialWeb do
  #   pipe_through :api
  # end
end