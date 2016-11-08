defmodule OpenuniApi.Plug.Authenticate do
  use Phoenix.Controller

  alias OpenuniApi.User
  alias OpenuniApi.Session
  alias OpenuniApi.Repo


  def init(default), do: default

  def call(conn, _default) do
    session = Session.get_session(conn)

    if session != nil do
      current_user = Repo.get_by(User, id: Map.get(session, :user_id))
      assign(conn, :current_user, current_user)
    else
      conn
        |> put_status(:unauthorized)
        |> put_view(OpenuniApi.ErrorView)
        |> render("401.json")
        |> halt
    end
  end
end
