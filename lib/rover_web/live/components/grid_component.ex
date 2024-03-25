defmodule RoverWeb.GridComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    sorted_grid =
      assigns.grid
      |> Map.to_list()
      |> Enum.sort_by(fn {{x, y}, _value} -> {-y, x} end)

    assigns =
      assign(assigns, :sorted_grid, sorted_grid)

    ~H"""
    <div class="flex justify-center">
      <div style={"display: grid; grid-template-columns: repeat(" <> Integer.to_string(@size) <> ", minmax(0, 1fr)); gap: 1px;"}>
        <%= for {key, value} <- @sorted_grid do %>
          <div
            class="w-16 h-16 flex justify-center items-center border"
            style="grid-row: #{elem(key, 1) + 1}; grid-column: #{elem(key, 0) + 1};"
          >
            <%= if is_map(value) and value.rover do %>
              <%= live_component(RoverWeb.RoverComponent,
                id: "rover-#{elem(key, 0)}-#{elem(key, 1)}",
                direction: value.direction
              ) %>
            <% else %>
              <div class="bg-white-400 flex justify-center items-center">
                <span class="text-xs text-black">
                  &lbrace;<%= elem(key, 0) %>, <%= elem(key, 1) %>&rbrace;
                </span>
              </div>
            <% end %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
