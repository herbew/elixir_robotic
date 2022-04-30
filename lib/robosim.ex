defmodule RoboSim do
	
	defmodule RobotType do
		@type direction :: :north |  :south |   :east| :west
		@type position :: {x :: integer, y :: integer}
		@type t :: %{direction: direction, position: position}
		
		defstruct direction: :north, position: {0,0}
	end
	
	
	@doc """
	Initial direction and position with directions are: 
	`:north`, `:east`, `:south`, `:west`
	"""
	
	@spec initialize(direction :: RoboSim.RobotType.direction, 
		position :: RoboSim.RobotType.position) :: %RobotType{}
		
	def initialize(direction \\ :north, position \\ {0,0}) do
		# elem -- access a tuple by index
		cond do
		
			direction not in [:north, :east, :south, :west] -> 
				{:error, "invalid direction"}
				
			not is_tuple(position) or tuple_size(position) != 2 or \
			not is_number(elem(position, 0)) or \
			not is_number(elem(position, 1)) -> 
				{:error, "invalid position"}
				
			true -> %RobotType{direction: direction, position: position}
		
		end
	end
	
	@doc """
	The robot's movement with valid  instructions are: 
	"R" (turn right), "L", (turn left), and "A" (advance)
	"""
	@spec move(robot :: any, instructions :: String.t()) :: %RobotType{}
	def move({:error, _} = error, _), do: error
	def move(robot, ""), do: robot
	def move(robot, instructions) do
		splitted = String.split_at(instructions, 1)
		current_instruction = elem(splitted, 0)
		remaining_instructions = elem(splitted, 1)
		robot = move_step(robot, current_instruction)
		move(robot, remaining_instructions)
	end
	
	defp move_step(robot, instruction) do
		case instruction do
			"R" -> move_right(robot)
			"L" -> move_left(robot)
			"A" -> move_advance(robot)
			_ -> {:error, "invalid instruction"}
		end
	end
	
	defp move_right(robot) do
		new_direction = case robot.direction do
				:north -> :east
				:east -> :south
				:south -> :west
				:west -> :north
			end
		
		%{robot | direction: new_direction}
	end
	
	defp move_left(robot) do
		new_direction = case robot.direction do
				:north -> :west
				:east -> :north
				:south -> :east
				:west -> :south
			end
		%{robot | direction: new_direction}
	end
	
	defp move_advance(robot) do
		x = elem(robot.position, 0)
		y = elem(robot.position, 1)
		case robot.direction do
			:north -> %{robot | position: {x, y + 1}}
			:east -> %{robot | position: {x + 1, y}}
			:south -> %{robot | position: {x, y - 1}}
			:west -> %{robot | position: {x -  1, y}}
		end
	end
	
	@doc """
	Return the robot's direction.
	"""
	@spec direction(robot :: %RobotType{}) :: RobotType.direction
	def direction(robot) do
	  robot.direction
	end
	
	@doc """
	Return the robot's position.
	"""
	@spec position(robot :: %RobotType{}) :: RobotType.position
	def position(robot) do
	  robot.position
	end
	
end
