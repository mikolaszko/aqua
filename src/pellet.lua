local Pellet = {}
Pellet.__index = Pellet

function Pellet:new()
	local pellet = {}
	pellet.x = 200
	pellet.y = 50
	pellet.img = love.graphics.newImage("assets/pellet.png")
	setmetatable(pellet, Pellet)
	pellet.reached = false
	return pellet
end

function Pellet:draw()
	if self.reached == false then
		love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, self.img:getWidth() / 2, self.img:getHeight() / 2)
	end
end

function Pellet:update(dt, fx, fy)
	if math.floor(self.x + 5) >= math.floor(fx) and math.floor(self.y + 5) >= math.floor(fy) then
		self.reached = true
	end

	if self.reached == false then
		local angle = math.atan2(fy - self.y, fx - self.x)
		print(angle)

		local cos = math.cos(angle)
		local sin = math.sin(angle)
		self.x = self.x + 500 * cos * dt
		self.y = self.y + 500 * sin * dt
	end
end

return Pellet
