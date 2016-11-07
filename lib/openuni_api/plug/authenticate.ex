defmodule OpenuniApi.Plug.Authenticate do
  use Phoenix.Controller

  alias OpenuniApi.User
  alias OpenuniApi.Session
  alias OpenuniApi.Repo


  def init(default), do: default

  def call(conn, _default) do
    case get_req_header(conn, "x-openuni-user.session_token") do
      [token] ->
          session = Repo.get_by(Session, token: token)

          if session != nil do
            current_user = Repo.get_by(User, id: Map.get(session, :user_id))
            assign(conn, :current_user, current_user)
          else
            unauthorized(conn)
          end
      _ ->
        unauthorized(conn)
    end
  end

  defp unauthorized(conn) do
    conn
      |> put_status(:unauthorized)
      |> put_view(OpenuniApi.ErrorView)
      |> render("401.json")
      |> halt
  end
end
