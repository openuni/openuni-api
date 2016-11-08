defmodule OpenuniApi.SessionController do
  use OpenuniApi.Web, :controller

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias OpenuniApi.User
  alias OpenuniApi.Session

  def create(conn, %{"user" => user_params}) do
    user = Repo.get_by(User, email: user_params["email"])
    cond do
      user && checkpw(user_params["password"], user.password_hash) ->
        session_changeset = Session.registration_changeset(%Session{}, %{user_id: user.id})
        {:ok, session} = Repo.insert(session_changeset)
        conn
        |> put_status(:created)
        |> render("show.json", session: session)
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

  def delete(conn) do
    session = Session.get_session(conn)

    if session != nil do
      Repo.delete!(session)
      conn
        |> put_status(204)
        |> halt
    else
      conn
        |> put_status(:unauthorized)
        |> render("401.json")
    end
  end
end
