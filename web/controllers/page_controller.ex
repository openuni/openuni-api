defmodule OpenuniApi.PageController do
  use OpenuniApi.Web, :controller

  plug OpenuniApi.Plug.Authenticate

  def index(conn, _params) do
    render conn, "index.json"
  end
end
