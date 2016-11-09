defmodule OpenuniApi.SessionView do
  use OpenuniApi.Web, :view

  def render("show.json", %{session: session, user: user}) do
    %{user: %{
      email: Map.get(user, :email),
      token: Map.get(session, :token)
    }}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token}
  end

  def render("error.json", _anything) do
    %{errors: "failed to authenticate"}
  end
end
