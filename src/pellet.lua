local Pellet = {}
Pellet.__index = Pellet

function Pellet:new()
	local pellet = {}
	pellet.x = -1
	pellet.y = -1
	pellet.img = love.graphics.newImage("assets/pellet.png")
	setmetatable(pellet, Pellet)
	return pellet
end

function Pellet:draw()
	love.graphics.draw(self.img, self.x, self.y)
end

function Pellet:update(dt, fx, fy)
	local angle = math.atan2(fy - self.y, fx - self.x)
	print(angle)

	local cos = math.cos(angle)
	local sin = math.sin(angle)
	self.x = self.x + 100 * cos * dt
	self.y = self.y + 100 * sin * dt
end

return Pellet
