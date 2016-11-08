defmodule OpenuniApi.Router do
  use OpenuniApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OpenuniApi do
    pipe_through :api # Use the default api stack

    get "/", PageController, :index

    resources "/users", UserController, only: [:create]

    resources "/sessions", SessionController, only: [:create]
    delete "/sessions", SessionController, :delete
  end
end
