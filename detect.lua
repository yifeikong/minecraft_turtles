local droid = dofile('droid.lua')

local function main()
	direction = args[1]
	local result = droid.detect(direction)
	print(result)
end

args = {...}
main()
