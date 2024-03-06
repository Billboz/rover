# Rover

# OVERVIEW
Create a Rover game where the user clicks a button to generate moves for the rover and the rover moves on the grid.
Use the SVG code from the Vitali project to create the component.

# TODO List for Rover Game

## Backend
- [x] Create the Rover phoenix app
- [x] Run mix ecto.create
- [x] Run `mix deps.get`
- [x] Create `rover.ex` and place it in the `/lib/rover/` folder
- [?] Define a [Grid](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#20%2C31-20%2C31) module in `/lib/rover/grid.ex` to manage the grid's dimensions and state.
- [x] Implement functions in [Grid](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#20%2C31-20%2C31) to initialize the grid with a specified size.
- [x] Update [Rover](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#1%2C3-1%2C3) module in `/lib/rover/rover.ex` to include starting position and handle commands (Left, Right, Forward).
- [?] Create a [Game](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#7%2C23-7%2C23) module in `/lib/rover/game.ex` to manage the game state, including the rover and grid.
- [x] Implement functions in [Game](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#7%2C23-7%2C23) to start a new game, process commands, and update the game state.
- [?] Create a `RoverLive` module in `/lib/rover_web/live/rover_live.ex` for the LiveView component that displays the rover and grid.
- [?] Implement the LiveView's render function to display the grid and rover using SVG, similar to Vitali's approach. To big for me now.
- [x] Implement the LiveView's handle_event function to handle the "left", "right", and "forward" events.
- [?] Implement the LiveView's handle_event function to handle the "run" event.
finish incorporating these goals
- [ ] Show it in svg
- [ ] Work of showing the robot moving on the grid
- [ ] Stretch goal - show the robot on a -10 to +10 grid with history - track that in the robot itself by changing the color of the robot.


## General
- [ ] Write tests for all modules
- [ ] Implement error handling