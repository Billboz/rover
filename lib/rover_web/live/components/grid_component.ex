defmodule RoverWeb.GridComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-9 gap-1">
      <%= for {_key, value} <- @grid do %>
        <div
          class="w-16 h-16 flex justify-center items-center"
          style="grid-row: #{elem(_key, 1) + 1}; grid-column: #{elem(_key, 0) + 1};"
        >
          <%= if is_map(value) and value.rover do %>
            <%= live_component(RoverWeb.RoverComponent, id: "rover-id", direction: value.direction) %>
          <% else %>
            <div class="bg-gray-400"></div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end

  # def mount(_params, _session, socket) do
  #   grid = Rover.Grid.new()

  #   {:ok, assign(socket, grid: grid)}
  # end

  # def direction_icon(:north), do: "/images/roverNorth.svg"
  # def direction_icon(:south), do: "/images/roverSouth.svg"
  # def direction_icon(:east), do: "/images/roverEast.svg"
  # def direction_icon(:west), do: "/images/roverWest.svg"
end

# def render(assigns) do
#   ~H"""
#   <div class="grid grid-cols-9 gap-1">
#     <%= for {_key, value} <- @grid do %>
#       <div
#         class={
#         "w-16 h-16 flex justify-center items-center " <>
#         (if is_map(value) and value.rover, do: "bg-transparent", else: "bg-gray-200")
#       }
#         style="grid-row: #{elem(_key, 1) + 1}; grid-column: #{elem(_key, 0) + 1};"
#       >
#         <%= if is_map(value) and value.rover do %>
#           <img src="#{direction_icon(value.direction)}" alt="Rover" width="50" height="50" />
#         <% end %>
#       </div>
#     <% end %>
#   </div>
#   """
# end

# def mount(_params, _session, socket) do
#   grid = Rover.Grid.new()

#   {:ok, assign(socket, grid: grid)}
# end

# def direction_icon(:north), do: "/images/roverNorth.svg"
# def direction_icon(:south), do: "/images/roverSouth.svg"
# def direction_icon(:east), do: "/images/roverEast.svg"
# def direction_icon(:west), do: "/images/roverWest.svg"
