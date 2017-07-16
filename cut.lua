local droid = dofile('droid.lua')	

local function main()
	length = args[1]
	depth = args[2]
	droid.cut(length, depth)
end

args = {...}
main()