defmodule OpenuniApi.PageControllerTest do
  use OpenuniApi.ConnCase

  alias OpenuniApi.User
  alias OpenuniApi.Session

  @valid_attrs %{email: "foo@bar.com", password: "s3cr3t"}

  setup %{conn: conn} do
    user_changeset = User.registration_changeset(%User{}, @valid_attrs)
    user = Repo.insert! user_changeset

    session_changeset = Session.registration_changeset(%Session{}, %{user_id: Map.get(user, :id)})
    session = Repo.insert! session_changeset

    {:ok, conn: conn
      |> put_req_header("accept", "application/json")
      |> put_req_header("x-openuni-user.token", Map.get(session, :token))}
  end

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert json_response(conn, 200) == %{"data" => "Hello, world!"}
  end
end
