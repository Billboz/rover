defmodule RoverWeb.GameLive do
  use Phoenix.LiveView
  alias Rover.{Robot, Grid}

  def mount(_params, _session, socket) do
    grid = Rover.Grid.new()
    size = Rover.Grid.width()
    robot = Rover.Robot.new()
    socket = assign(socket, grid: grid, size: size, robot: robot)
    {:ok, socket}
  end

  def handle_event("left", _params, socket) do
    robot = Robot.left(socket.assigns.robot)
    grid = Grid.update_with_rover(socket.assigns.grid, robot)
    {:noreply, assign(socket, grid: grid, robot: robot)}
  end

  def handle_event("forward", _params, socket) do
    robot = Robot.forward(socket.assigns.robot)
    grid = Grid.update_with_rover(socket.assigns.grid, robot)
    {:noreply, assign(socket, grid: grid, robot: robot)}
  end

  def handle_event("right", _params, socket) do
    robot = Robot.right(socket.assigns.robot)
    grid = Grid.update_with_rover(socket.assigns.grid, robot)
    {:noreply, assign(socket, grid: grid, robot: robot)}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center">
      <%= live_component(RoverWeb.GridComponent, id: "grid", grid: @grid, size: Rover.Grid.width()) %>
      <div class="mt-4 space-x-4">
        <button
          class="bg-blue-500 text-white font-bold py-2 px-4 rounded-lg active:scale-95 hover:scale-105 transition-transform"
          phx-click="left"
        >
          Left
        </button>
        <button
          class="bg-green-500 text-white font-bold py-2 px-4 rounded-lg active:scale-95 hover:scale-105 transition-transform"
          phx-click="forward"
        >
          Forward
        </button>
        <button
          class="bg-blue-500 text-white font-bold py-2 px-4 rounded-lg active:scale-95 hover:scale-105 transition-transform"
          phx-click="right"
        >
          Right
        </button>
      </div>
    </div>
    """
  end
end
