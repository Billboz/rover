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
- [ ] Define a [Grid](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#20%2C31-20%2C31) module in `/lib/rover/grid.ex` to manage the grid's dimensions and state.
- [x] Implement functions in [Grid](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#20%2C31-20%2C31) to initialize the grid with a specified size.
- [x] Update [Rover](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#1%2C3-1%2C3) module in `/lib/rover/rover.ex` to include starting position and handle commands (Left, Right, Forward).
- [?] Create a [Game](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#7%2C23-7%2C23) module in `/lib/rover/game.ex` to manage the game state, including the rover and grid.
- [x] Implement functions in [Game](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#7%2C23-7%2C23) to start a new game, process commands, and update the game state.
- [ ] Create a `RoverLive` module in `/lib/rover_web/live/rover_live.ex` for the LiveView component that displays the rover and grid.
- [ ] Implement the LiveView's render function to display the grid and rover using SVG, similar to Vitali's approach.
- [ ] Implement the LiveView's handle_event function to handle the "left", "right", and "forward" events.
- [ ] Implement the LiveView's handle_event function to handle the "run" event.
finish incorporating these goals
Show it in svg
the work of showing the robot moving on the grid
stretch goal - show the robot on a -10 to +10 grid with history - track that in the robot itself by changing the color of the robot.


- [ ] Implement the business logic for the Rover
- [ ] Create a module for the Grid
- [ ] Implement the business logic for the Grid
- [ ] Create a module for the Game
- [ ] Implement the business logic for the Game
- [ ] Create a module for the LiveView
- [ ] Implement the business logic for the LiveView
- [ ] Create a module for the Button
- [ ] Implement the business logic for the Button

## Frontend
- [ ] Create a LiveView for the Rover
- [ ] Create a LiveView for the Grid
- [ ] Create a LiveView for the Game
- [ ] Create a LiveView for the Button
- [ ] Create an SVG for the Rover
- [ ] Create a button to play the game
- [ ] Implement the business logic for the SVG
- [ ] Implement the business logic for the button
- [ ] Create a LiveView template for the `RoverLive` module in `/lib/rover_web/live/rover_live.html.heex` to display the grid, rover, and control buttons.
- [ ] Use SVG to draw the grid and rover in the LiveView template, adapting code from Vitali's SVG implementation.
- [ ] Add event handlers in `RoverLive` for the control buttons (Left, Right, Forward, Many) to send commands to the rover.
- [ ] Implement a function in `RoverLive` to handle the "Many" command by generating a random list of commands and executing them.

## General
- [ ] Write tests for all modules
- [ ] Implement error handling
- [ ] Write tests for the [Grid](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#20%2C31-20%2C31), [Rover](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#1%2C3-1%2C3), and [Game](file:///Users/billboz/learnings/grox/rover_alpha/rover/TODO.md#7%2C23-7%2C23) modules to ensure correctness.
- [ ] Implement error handling in the `RoverLive` module to gracefully handle invalid commands or game states.