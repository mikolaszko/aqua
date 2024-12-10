local Filth = {}
Filth.__index = Filth

local width, height = love.graphics.getDimensions()

function Filth:new()
    local filth = {}
    -- glass is usually very clean at the beginning
    filth.intensity = 0

    setmetatable(filth, Filth)
    return filth
end

function Filth:draw()
    love.graphics.setColor(15/255, 53/255, 3/255, self.intensity)

    love.graphics.rectangle("fill", trunc_w, trunc_h, width - (2 * trunc_w), height -  (2* trunc_h))
end

function Filth:update(timeElapsed)
    self.intensity = timeElapsed / 100 * 7
end

return Filth