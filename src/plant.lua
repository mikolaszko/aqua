local Plant = {}
Plant.__index = Plant

function Plant:new(img_src)
	local plant = {}
	local width, height = love.graphics.getDimensions()
	plant.x = love.math.random(trunc_w + 20, width - trunc_w - 20)
	plant.y = height - trunc_h - 60
	plant.img = love.graphics.newImage(img_src)
	setmetatable(plant, Plant)

	return plant
end

function Plant:draw()
	love.graphics.draw(self.img, self.x, self.y, 0, 2, 4, self.img:getWidth() / 2, self.img:getHeight() / 2)
end

function Plant:update(dt) end

return Plant
