local droid = dofile('droid.lua')

local function rectFarm(length, width)
	for i = 1, width -1 do
		for i = 1, length do
			droid.dig('q')
			droid.walk('w')
		end
		droid.walk('s', length-1)
		droid.walk('a')
	end
	for i = 1, length do
		droid.dig('q')
		droid.walk('w')
	end
	droid.walk('d', width-1)
	droid.walk('s', width-1)

end

local function main ()
	length = args[1]
	width = args[2]
	rectFarm(length, width)
end

args = {...}
main()



