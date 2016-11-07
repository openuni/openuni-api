defmodule OpenuniApi.PageView do
  use OpenuniApi.Web, :view

  def render("index.json", _assigns) do
    %{data: "Hello, world!"}
  end
end
