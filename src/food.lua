local Food = {}
Food.__index = Food

function Food:new()
	local food = {}
	food.img = love.graphics.newImage("assets/food.png")
	food.rad = -math.pi / 2
	food.clicked = false
	setmetatable(food, Food)
	return food
end

function Food:draw()
	love.graphics.circle("fill", 200, 50, 30)
	love.graphics.draw(self.img, 140 + (self.img:getWidth() / 2), -15 + (self.img:getHeight() / 2), 0, 1, 1)
	love.graphics.setColor(0, 0, 0)

	love.graphics.arc("line", "open", 200, 50, 25, -math.pi / 2, self.rad)
	love.graphics.arc("line", "open", 200, 51, 25, -math.pi / 2, self.rad)
	love.graphics.arc("line", "open", 200, 52, 25, -math.pi / 2, self.rad)
	love.graphics.setColor(1, 1, 1)
end

function Food:update(dt)
	if self.clicked == true then
		-- arc is more visible this way
		if self.rad < -1.4 then
			self.rad = self.rad + dt
		else
			self.rad = self.rad + dt / 5
		end

		if self.rad > 5 then
			self.rad = -math.pi / 2
			self.clicked = false
		end
	end
end

function Food:checkClick(x, y)
	if CheckHitbox(x, y, 170, 20, 230, 80) and self.clicked == false then
		self.clicked = true
	end
end

return Food
