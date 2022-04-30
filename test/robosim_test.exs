defmodule RoboSimTest do
    use ExUnit.Case
    
	test "1. Robotic initialize" do
		robot = RoboSim.initialize()
		assert RoboSim.direction(robot) == :north
		assert RoboSim.position(robot) == {0, 0}
	end #test "1. Robotic initialize" do
	
	@tag :pending
	test "2. Robotic with a valid parameters" do
		robot = RoboSim.initialize(:north, {0, 0})
		assert RoboSim.direction(robot) == :north
		assert RoboSim.position(robot) == {0, 0}
		
		robot = RoboSim.initialize(:south, {-2, -2})
		assert RoboSim.direction(robot) == :south
		assert RoboSim.position(robot) == {-2, -2}
		
		robot = RoboSim.initialize(:east, {1, 1})
		assert RoboSim.direction(robot) == :east
		assert RoboSim.position(robot) == {1, 1}
		
		robot = RoboSim.initialize(:west, {-2, -2})
		assert RoboSim.direction(robot) == :west
		assert RoboSim.position(robot) == {-2, -2}
	end #test "2. Robotic with a valid parameters" do
	
	@tag :pending
	test "3. Robotic with a invalid parameters" do
		assert RoboSim.initialize(:xxx, {0, 0}) == {:error, "invalid direction"}
		assert RoboSim.initialize(:east, {0}) == {:error, "invalid position"}
	end #test "3. Robotic with a invalid parameters" do
	
	@tag :pending
  	test "4. Rotating move Right" do
  		robot = RoboSim.initialize(:north, {0, 0}) |> RoboSim.move("R")
  		assert RoboSim.direction(robot) == :east
		assert RoboSim.position(robot) == {0, 0}
  		
  		robot = RoboSim.initialize(:east, {0, 0}) |> RoboSim.move("R")
  		assert RoboSim.direction(robot) == :south
  		assert RoboSim.position(robot) == {0, 0}
  		
  		robot = RoboSim.initialize(:south, {0, 0}) |> RoboSim.move("R")
  		assert RoboSim.direction(robot) == :west
  		assert RoboSim.position(robot) == {0, 0}
  		
  		robot = RoboSim.initialize(:west, {0, 0}) |> RoboSim.move("R")
  		assert RoboSim.direction(robot) == :north
  		assert RoboSim.position(robot) == {0, 0}
	end #test "4. Rotating move Right" do
	
	@tag :pending
  	test "5. Rotating move Left" do
  		robot = RoboSim.initialize(:north, {0, 0}) |> RoboSim.move("L")
  		assert RoboSim.direction(robot) == :west
		assert RoboSim.position(robot) == {0, 0}
		
		robot = RoboSim.initialize(:west, {0, 0}) |> RoboSim.move("L")
  		assert RoboSim.direction(robot) == :south
  		assert RoboSim.position(robot) == {0, 0}
		
		robot = RoboSim.initialize(:south, {0, 0}) |> RoboSim.move("L")
  		assert RoboSim.direction(robot) == :east
  		assert RoboSim.position(robot) == {0, 0}
		
		robot = RoboSim.initialize(:east, {0, 0}) |> RoboSim.move("L")
  		assert RoboSim.direction(robot) == :north
  		assert RoboSim.position(robot) == {0, 0}
  	end #test "5. Rotating move Left" do
  	
  	@tag :pending
  	test "6. Forwarding move Advance" do
  		robot = RoboSim.initialize(:north, {0, 0}) |> RoboSim.move("A")
  		assert RoboSim.direction(robot) == :north
  		assert RoboSim.position(robot) == {0, 1}
  		
  		robot = RoboSim.initialize(:south, {0, 0}) |> RoboSim.move("A")
  		assert RoboSim.direction(robot) == :south
  		assert RoboSim.position(robot) == {0, -1}
  		
  		robot = RoboSim.initialize(:east, {0, 0}) |> RoboSim.move("A")
  		assert RoboSim.direction(robot) == :east
  		assert RoboSim.position(robot) == {1, 0}
  		
  		robot = RoboSim.initialize(:west, {0, 0}) |> RoboSim.move("A")
  		assert RoboSim.direction(robot) == :west
  		assert RoboSim.position(robot) == {-1, 0}
  	end #test "6. Forwarding move Advance" do
  	
  	@tag :pending
  	test "7. Combination rotating and forwarding instructions" do
  		robot = RoboSim.initialize(:north, {0, 0}) |> RoboSim.move("LARRRAL")
  		assert RoboSim.direction(robot) == :east
  		assert RoboSim.position(robot) == {-1, -1}
  		
  		assert RoboSim.initialize(:north, {0, 0}) |> RoboSim.move("LARSRAL") == {:error, "invalid instruction"}
  		
  	end #test "7. Combination rotating and forwarding instructions" do
  	
  	
end