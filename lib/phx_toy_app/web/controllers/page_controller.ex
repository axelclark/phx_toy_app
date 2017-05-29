defmodule PhxToyApp.Web.PageController do
  use PhxToyApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
