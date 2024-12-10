local Fish = {}
Fish.__index = Fish

function Fish:new(img_src, speed)
    local fish = {}
    local random = love.math.random(0, 1)
    width, height = love.graphics.getDimensions()
    fish.x = love.math.random(trunc_w, width - trunc_w)
    fish.y = love.math.random(trunc_h + 20, height - trunc_h - 20)
    fish.speed = speed
    fish.img = love.graphics.newImage(img_src)
    -- TODO: tell Pablo to draw them to the right and change the sx
    if random == 0 then
        fish.swim_dir = "right"
        fish.sx = -1
    else 
        fish.swim_dir = "left"
        fish.sx = 1
    end
    setmetatable(fish, Fish)

    return fish
end

function Fish:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, self.sx, 1, self.img:getWidth()/2, self.img:getHeight()/2)
end

function Fish:update(dt)

    if self.swim_dir == "right" then
        self.x = self.x + (self.speed * dt)
    else 
        self.x = self.x - (self.speed * dt)
    end

    if self.x < trunc_w + 20 then
        self.swim_dir = "right"
        self.sx = -1
    elseif self.x > width - trunc_w - 20 then
        self.swim_dir = "left"
        self.sx = 1
    end
end

return Fish