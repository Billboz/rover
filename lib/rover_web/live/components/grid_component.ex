defmodule RoverWeb.GridComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-9 gap-1">
      <%= for {key, value} <- @grid do %>
        <div
          class="w-16 h-16 flex justify-center items-center"
          style="grid-row: #{elem(key, 1) + 1}; grid-column: #{elem(key, 0) + 1};"
        >
          <%= if is_map(value) and value.rover do %>
            <%= live_component(RoverWeb.RoverComponent,
              id: "rover-#{elem(key, 0)}-#{elem(key, 1)}",
              direction: value.direction
            ) %>
          <% else %>
            <div class="bg-gray-400"></div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end
end
