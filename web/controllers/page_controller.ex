defmodule OpenuniApi.PageController do
  use OpenuniApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.json"
  end
end
