defmodule RoverWeb.GameLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, grid: initial_grid_state(), command: "")}
  end

  def handle_event("run", _params, socket) do
    # Implement game logic for 'Run' action
    {:noreply, socket}
  end

  def handle_event("next", _params, socket) do
    # Implement game logic for 'Next' action
    {:noreply, socket}
  end

  # def render(assigns) do
  #   ~H"""
  #   <div>
  #     <h1>Game Grid</h1>
  #     <!-- Render grid based on assigns.grid -->
  #     <button phx-click="run">Run</button>
  #     <button phx-click="next">Next</button>
  #   </div>
  #   """
  # end

  defp initial_grid_state do
    # Define initial grid state
  end
end
