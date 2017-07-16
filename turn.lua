local function turn (direction, times)
	times = times or 1
	if direction == 'left' then
		func = turtle.turnLeft
	elseif direction == 'right' then
		func = turtle.turnRight
	end
	for i = 1, times do
		func()
	end
end

local function main ()
	direction = args[1]
	times = args[2]
	turn(direction, times)
end

args = {...}
main()


