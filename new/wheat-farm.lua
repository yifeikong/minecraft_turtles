
local droid = dofile('droid.lua')

local directions = {
    forward = 1,
    left = 2,
    back = 3,
    right = 4,
    up = 5,
    down = 6
}

local function wheatFarm9x9(interval)
    interval = interval or 1
    
    droid.go(directions.forward, 8, turtle.digDown)
    droid.go(directions.left, 1, turtle.digDown)
    droid.go(directions.back, 8, turtle.digDown)
    droid.go(directions.left, 1, turtle.digDown)

    droid.go(directions.forward, 8, turtle.digDown)
    droid.go(directions.left, 1, turtle.digDown)
    droid.go(directions.back, 8, turtle.digDown)
    droid.go(directions.left, 1, turtle.digDown)

    droid.go(directions.forward, 8, turtle.digDown)
    droid.go(directions.left, 1, turtle.digDown)
    droid.go(directions.back, 8, turtle.digDown)
    droid.go(directions.left, 1, turtle.digDown)

    droid.go(directions.forward, 8, turtle.digDown)
    droid.go(directions.left, 1, turtle.digDown)
    droid.go(directions.back, 8, turtle.digDown)
    droid.go(directions.left, 1, turtle.digDown)

    droid.go(directions.forward, 8, turtle.digDown)
    droid.go(directions.right, 8)
    droid.go(directions.back, 8)
    
    -- TODO: confirm wheat
    droid.go(directions.forward, 8, turtle.placeDown)
    droid.go(directions.left, 1, turtle.placeDown)
    droid.go(directions.back, 8, turtle.placeDown)
    droid.go(directions.left, 1, turtle.placeDown)

    droid.go(directions.forward, 8, turtle.placeDown)
    droid.go(directions.left, 1, turtle.placeDown)
    droid.go(directions.back, 8, turtle.placeDown)
    droid.go(directions.left, 1, turtle.placeDown)

    droid.go(directions.forward, 8, turtle.placeDown)
    droid.go(directions.left, 1, turtle.placeDown)
    droid.go(directions.back, 8, turtle.placeDown)
    droid.go(directions.left, 1, turtle.placeDown)

    droid.go(directions.forward, 8, turtle.placeDown)
    droid.go(directions.left, 1, turtle.placeDown)
    droid.go(directions.back, 8, turtle.placeDown)
    droid.go(directions.left, 1, turtle.placeDown)

    droid.go(directions.forward, 8, turtle.placeDown)
    droid.go(directions.right, 8)
    droid.go(directions.back, 8)

end

local function main ()
    wheatFarm9x9()
end

main()
