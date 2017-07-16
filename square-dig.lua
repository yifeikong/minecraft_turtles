local droid = dofile('droid.lua')	

local function main()
	length = args[1]
	droid.squareDig(length)
end

args = {...}
main()