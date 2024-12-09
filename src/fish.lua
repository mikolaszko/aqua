local Fish = {}
Fish.__index = Fish

function Fish:new(img_src, speed)
    local fish = {}
    local width, height = love.graphics.getDimensions()
    fish.x = love.math.random(0, width)
    fish.y = love.math.random(0, height)
    fish.speed = speed
    fish.img = love.graphics.newImage(img_src)
    setmetatable(fish, Fish)

    return fish
end

function Fish:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, self.img:getWidth()/2, self.img:getHeight()/2)
end

function Fish:update(dt)
    self.x = self.x + (self.speed * dt)
end

return Fish