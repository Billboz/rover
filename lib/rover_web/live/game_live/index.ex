defmodule RoverWeb.GameLive.Index do
  use RoverWeb, :live_view

  alias Rover.Rovers
  alias Rover.Rovers.Game

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :games, Rovers.list_games())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Game")
    |> assign(:game, Rovers.get_game!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Game")
    |> assign(:game, %Game{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Games")
    |> assign(:game, nil)
  end

  @impl true
  def handle_info({RoverWeb.GameLive.FormComponent, {:saved, game}}, socket) do
    {:noreply, stream_insert(socket, :games, game)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    game = Rovers.get_game!(id)
    {:ok, _} = Rovers.delete_game(game)

    {:noreply, stream_delete(socket, :games, game)}
  end
end
