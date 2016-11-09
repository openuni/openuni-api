defmodule OpenuniApi.SessionController do
  use OpenuniApi.Web, :controller

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias OpenuniApi.User
  alias OpenuniApi.Session


  plug OpenuniApi.Plug.Authenticate when action in [:delete]


  def create(conn, %{"user" => user_params}) do
    user = Repo.get_by(User, email: user_params["email"])
    cond do
      user && checkpw(user_params["password"], user.password_hash) ->
        session_changeset = Session.registration_changeset(%Session{}, %{user_id: user.id})
        {:ok, session} = Repo.insert(session_changeset)
        conn
          |> put_status(:created)
          |> assign(:session, session)
          |> render("show.json", session: session, user: user)
      user ->
        conn
          |> put_status(:unauthorized)
          |> render("error.json", user_params)
      true ->
        dummy_checkpw
        conn
          |> put_status(:unauthorized)
          |> render("error.json", user_params)
    end
  end

  def delete(conn, _params) do
    session = Session.get_session(conn)

    if session != nil do
      Repo.delete!(session)
      conn
        |> put_status(:no_content)
        |> json("")
        |> halt
    else
      conn
        |> put_status(:unauthorized)
        |> render("401.json")
    end
  end
end
