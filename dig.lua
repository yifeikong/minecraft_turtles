local droid = dofile('droid.lua')

local function main()
	direction = args[1]
	droid.dig(direction)
end

args = {...}
main()