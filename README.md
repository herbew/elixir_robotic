# Elixir Robotic Simulator - defstruct

A robot factory's test facility needs a program to verify robot movements.
The robots have three possible movements:
- turn right
- turn left
- advance
Robots are placed on a hypothetical infinite grid, facing a particular 
direction (north, east, south, or west) at a set of {x,y} 
coordinates, e.g., {3,8}, with coordinates increasing to the north and east.

The robot then receives a number of instructions, at which point the testing 
facility verifies the robot's new position, and in which direction it is pointing.

- The letter-string "RAALAL" means:
	- Turn right
	- Advance twice
	- Turn left
	- Advance once
	- Turn left yet again
Say a robot starts at {7, 3} facing north. 
Then running this stream of instructions should leave it at {9, 4} facing west.

## mix test
Excluding tags: [:pending]

RoboSimTest [test/robosim_test.exs]
  * test 5. Rotating move Left (excluded) [L#55]
  * test 6. Forwarding move Advance (excluded) [L#74]
  * test 2. Robotic with a valid parameters (excluded) [L#11]
  * test 3. Robotic with a invalid parameters (excluded) [L#30]
  * test 7. Combination rotating and forwarding instructions (excluded) [L#93]
  * test 4. Rotating move Right (excluded) [L#36]
  * test 1. Robotic initialize (0.00ms) [L#4]

Finished in 0.06 seconds (0.00s async, 0.06s sync)
7 tests, 0 failures, 6 excluded


## mix test --include pending
Including tags: [:pending]

RoboSimTest [test/robosim_test.exs]
  * test 4. Rotating move Right (2.6ms) [L#36]
  * test 3. Robotic with a invalid parameters (0.00ms) [L#30]
  * test 5. Rotating move Left (0.00ms) [L#55]
  * test 1. Robotic initialize (0.00ms) [L#4]
  * test 2. Robotic with a valid parameters (0.00ms) [L#11]
  * test 7. Combination rotating and forwarding instructions (0.01ms) [L#93]
  * test 6. Forwarding move Advance (0.00ms) [L#74]

Finished in 0.06 seconds (0.00s async, 0.06s sync)
7 tests, 0 failures
