local droid = dofile('droid.lua')	

local function main()
	length = args[1]
	depth = args[2]
	droid.cubicDig(length, depth)
end

args = {...}
main()
