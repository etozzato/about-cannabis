defmodule AboutCannabis.PageController do
  use AboutCannabis.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
