defmodule SpotifyVisualiserWeb.PageController do
  use SpotifyVisualiserWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
