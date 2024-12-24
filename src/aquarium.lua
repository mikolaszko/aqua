local Aquarium = {}
Aquarium.__index = Aquarium

--float size_w | float size_h
function Aquarium:new(size_w, size_h)
	local aquarium = {}
	trunc_w = Width * size_w
	trunc_h = Height * size_h

	glass_filth = FILTH:new()

	setmetatable(aquarium, Aquarium)
	return aquarium
end

function Aquarium:draw()
	glass_filth:draw()
	love.graphics.setColor(0, 0, 0)
	love.graphics.line(trunc_w, trunc_h, trunc_w, Height - trunc_h)
	love.graphics.line(trunc_w, Height - trunc_h, Width - trunc_w, Height - trunc_h)
	love.graphics.line(Width - trunc_w, trunc_h, Width - trunc_w, Height - trunc_h)
	love.graphics.setColor(122 / 255, 122 / 255, 255 / 255, 0.3)
	love.graphics.rectangle("fill", trunc_w + 1, trunc_h - 1, Width - (2 * trunc_w) - 1, Height - (2 * trunc_h))
	love.graphics.setColor(1, 1, 1)
end

function Aquarium:update(dt)
	glass_filth:update()
end

return Aquarium
