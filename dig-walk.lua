local droid = dofile('droid.lua')

local function main()
	direction = args[1]
	steps = args[2]
	droid.digWalk(direction, steps)
end

args = {...}
main()