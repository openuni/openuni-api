defmodule OpenuniApi.Router do
  use OpenuniApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OpenuniApi do
    pipe_through :api # Use the default api stack

    # Users
    resources "/users", UserController, only: [:create]
    post "/users/resend_confirmation_token", UserController, :resend_confirmation_token
    post "/users/confirm/:token", UserController, :confirm

    # Sessions
    resources "/sessions", SessionController, only: [:create]
    delete "/sessions", SessionController, :delete
    get "/sessions/create_from_token", SessionController, :create_from_token
  end
end
