-- droid module

local droid = {}

local function repeater(object, times)
    for i = 1, times do
        if type(object) == 'function' then
            object()
        elseif type(object) == 'table' then
            for i = 1, #object do
                object[i]()
            end
        end
    end
end

function droid.walk(direction, steps)
    steps = steps or 1

    if direction == 'w' then
        repeater(turtle.forward, steps)
    elseif direction == 's' then
        repeater(turtle.back, steps)
    elseif direction == 'q' then
        repeater(turtle.down, steps)
    elseif direction == 'e' then
        repeater(turtle.up, steps)
    elseif direction =='a' then
        turtle.turnLeft()
        repeater(turtle.forward, steps)
        turtle.turnRight()
    elseif direction == 'd' then
        turtle.turnRight()
        repeater(turtle.forward, steps)
        turtle.turnLeft()
    end
end

function droid.detect(direction)
    local result = false
    if direction == 'w' then
        result = turtle.detect()
    elseif direction == 'q' then 
        result = turtle.detectDown()
    elseif direction == 'e' then
        result = turtle.detectUp()
    elseif direction == 'a' then
        turtle.turnLeft()
        result = turtle.detect()
        turtle.turnRight()
    elseif direction == 'd' then
        turtle.turnRight()
        result = turtle.detect()
        turtle.turnLeft()
    elseif direction == 's' then
        turtle.turnLeft()
        turtle.turnLeft()
        result = turtle.detect()
        turtle.turnLeft()
        turtle.turnLeft()
    end
    return result
end

function droid.digIn(direction, steps)
    steps = steps or 1

    if direction == 'w' then
        repeater({turtle.dig, turtle.forward}, steps)
    elseif direction == 's' then
        turtle.turnLeft()
        turtle.turnLeft()
        repeater({turtle.dig, turtle.forward}, steps)
        turtle.turnLeft()
        turtle.turnLeft()
    elseif direction == 'q' then
        repeater({turtle.digDown, turtle.down}, steps)
    elseif direction == 'e' then
        repeater({turtle.digUp, turtle.up}, steps)
    elseif direction =='a' then
        turtle.turnLeft()
        repeater({turtle.dig, turtle.forward}, steps)
        turtle.turnRight()
    elseif direction == 'd' then
        turtle.turnRight()
        repeater({turtle.dig, turtle.forward}, steps)
        turtle.turnLeft()
    end
end

function droid.dig(direction)
	if direction == 'w' then
        turtle.dig()
    elseif direction == 's' then
        turtle.turnLeft()
        turtle.turnLeft()
        turtle.dig()
        turtle.turnLeft()
        turtle.turnLeft()
    elseif direction == 'q' then
        turtle.digDown()
    elseif direction == 'e' then
        turtle.digUp()
    elseif direction =='a' then
        turtle.turnLeft()
        turtle.dig()
        turtle.turnRight()
    elseif direction == 'd' then
        turtle.turnRight()
        turtle.dig()
        turtle.turnLeft()
    end
end

function droid.squareDig(length)
    droid.digIn('q')
    for i = 1, length-1 do
        droid.digIn('w', length-1)
        droid.walk('s', length-1)
        droid.digIn('a')
    end
    droid.digIn('w', length-1)
    droid.walk('d', length-1)
    droid.walk('s', length-1)
end

function droid.cubicDig(length, depth)
    for i = 1, depth do 
        droid.squareDig(length)
    end
end

function droid.cut(length, depth)
    droid.walk('e', depth)
    droid.cubicDig(length, depth)
end



function droid.drive()
    while true do
        local event, param = os.pullEvent('key')
        if event == 'key' then
            if param == 17 then
                droid.walk('w')
            elseif param == 'a' then
                droid.walk('a')
            elseif param == 's' then
                droid.walk('s')
            elseif param == 'd' then
                droid.walk('d')
            elseif param == 16 then
                droid.walk('q')
            elseif param == 'e' then
                droid.walk('e')
            elseif param == 28 then
            	break -- break out of "while"
            end
        end
    end
end

return droid