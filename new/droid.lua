-- 
-- the new droid module for season 3
-- by Yifei Kong

local droid = {}
local directions = {
    forward = 1,
    left = 2,
    back = 3,
    right = 4,
    up = 5,
    down = 6
}

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

-- go 'n' do task at each step, then repeat
-- TODO: up and down support
function droid.go(direction, steps, task)
    steps = steps or 1
    task = task or function () end

    local function atomJob() 
        task()
        turtle.forward();
    end

    if direction == directions.forward then
        repeater(atomJob, steps)
    elseif direction == directions.left then
        turtle.turnLeft()
        repeater(atomJob, steps)
        turtle.turnRight()
    elseif direction == directions.back then
        turtle.turnLeft()
        turtle.turnLeft()
        repeater(atomJob, steps)
        turtle.turnRight()
        turtle.turnRight()
    elseif direction == directions.right then
        turtle.turnRight()
        repeater(atomJob, steps)
        turtle.turnLeft()
    end
end

return droid