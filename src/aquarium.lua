local Aquarium = {}
Aquarium.__index = Aquarium

local width, height = love.graphics.getDimensions()

--float size_w | float size_h
function Aquarium:new(size_w, size_h)
	local aquarium = {}
	trunc_w = width * size_w
	trunc_h = height * size_h

	glass_filth = FILTH:new()

	setmetatable(aquarium, Aquarium)
	return aquarium
end

function Aquarium:draw()
	glass_filth:draw()
	love.graphics.setColor(0, 0, 0)

	love.graphics.line(trunc_w, trunc_h, trunc_w, height - trunc_h)
	love.graphics.line(trunc_w, height - trunc_h, width - trunc_w, height - trunc_h)
	love.graphics.line(width - trunc_w, trunc_h, width - trunc_w, height - trunc_h)

	love.graphics.setColor(1, 1, 1)
end

function Aquarium:update(dt)
	glass_filth:update()
end

return Aquarium

