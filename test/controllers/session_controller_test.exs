defmodule OpenuniApi.SessionControllerTest do
  use OpenuniApi.ConnCase

  alias OpenuniApi.Session
  alias OpenuniApi.User
  @valid_attrs %{email: "foo@bar.com", password: "s3cr3t"}

  setup %{conn: conn} do
    changeset =  User.registration_changeset(%User{}, @valid_attrs)
    Repo.insert changeset
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: @valid_attrs
    token = json_response(conn, 201)["data"]["token"]
    assert Repo.get_by(Session, token: token)
  end

  test "does not create resource and renders errors when password is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: Map.put(@valid_attrs, :password, "notright")
    assert json_response(conn, 401)["errors"] != %{}
  end

  test "does not create resource and renders errors when email is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: Map.put(@valid_attrs, :email, "not@found.com")
    assert json_response(conn, 401)["errors"] != %{}
  end

  test "deletes session when data is valid", %{conn: conn} do
    create_conn = post conn, session_path(conn, :create), user: @valid_attrs

    session = create_conn.assigns[:session]
    conn = put_req_header(conn, "x-openuni-user.session_token", Map.get(session, :token))

    delete_conn = delete conn, session_path(conn, :delete), user: @valid_attrs
    assert json_response(delete_conn, 204)
  end
end
