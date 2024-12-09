local Aquarium = {}
Aquarium.__index = Aquarium

function Aquarium:new()
    local aquarium= {}
    width, height = love.graphics.getDimensions()

    setmetatable(aquarium, Aquarium)
    return aquarium
end

function Aquarium:draw()
    love.graphics.setColor(0,0,0)
    
    love.graphics.setColor(1,1,1)
end

function Aquarium:update()
end

return Aquarium