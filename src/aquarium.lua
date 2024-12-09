local Aquarium = {}
Aquarium.__index = Aquarium

local width, height = love.graphics.getDimensions()
print(width, height)

trunc_w = width * 0.35
trunc_h = height * 0.2

function Aquarium:new()
    local aquarium= {}

    setmetatable(aquarium, Aquarium)
    return aquarium
end

function Aquarium:draw()
    love.graphics.setColor(0,0,0)

    love.graphics.line(trunc_w, trunc_h, trunc_w, height - trunc_h)
    love.graphics.line(trunc_w, height- trunc_h, width - trunc_w, height - trunc_h)
    love.graphics.line(width - trunc_w, trunc_h, width - trunc_w, height - trunc_h)

    love.graphics.setColor(1,1,1)
end

function Aquarium:update()
end

return Aquarium