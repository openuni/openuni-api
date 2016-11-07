defmodule OpenuniApi.ErrorView do
  use OpenuniApi.Web, :view

  def render("404.json", _assigns) do
    %{code: 404, message: "Page not found"}
  end

  def render("401.json", _assigns) do
    %{code: 401, message: "Unauthorized"}
  end

  def render("500.json", _assigns) do
    %{code: 500, message: "Internal server error"}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.json", assigns
  end
end
