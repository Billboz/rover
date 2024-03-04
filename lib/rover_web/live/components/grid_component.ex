# defmodule RoverWeb.GridComponent do
#   use Phoenix.LiveComponent

#   def render(assigns) do
#     ~H"""
#     <div class="grid">
#       <%= for {key, value} <- @grid do %>
#         <div class="<%= if value.rover, do: "rover", else: "empty" %>"
#              style="grid-row: <%= elem(key, 1) + @size + 1 %>; grid-column: <%= elem(key, 0) + @size + 1 %>;">
#           <%= if value.rover, do: direction_icon(value.direction) %>
#         </div>
#       <% end %>
#     </div>
#     """
#   end

#   def mount(_params, _session, socket) do
#     grid = Rover.Grid.new()

#     {:ok, assign(socket, grid: grid)}
#   end

#   defp direction_icon(:north), do: "↑"
#   defp direction_icon(:south), do: "↓"
#   defp direction_icon(:east), do: "→"
#   defp direction_icon(:west), do: "←"
# end
