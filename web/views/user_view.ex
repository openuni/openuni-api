defmodule OpenuniApi.UserView do
  use OpenuniApi.Web, :view

  def render("show.json", %{user: user}) do
    %{data: render_one(user, OpenuniApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, email: user.email}
  end
end
