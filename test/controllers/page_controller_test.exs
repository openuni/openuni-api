defmodule OpenuniApi.PageControllerTest do
  use OpenuniApi.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert json_response(conn, 200) == %{"data" => "Hello, world!"}
  end
end
