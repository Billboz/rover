defmodule RoverWeb.PageController do
  use RoverWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home)
  end

  def game(conn, _params) do
    render(conn, :game)
  end
end
