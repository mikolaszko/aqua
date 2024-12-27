local Food = {}
Food.__index = Food

local pellet = require("src.pellet")
Pellets = {}

function Food:new()
	local food = {}
	food.pack_img = love.graphics.newImage("assets/food.png")
	food.rad = -math.pi / 2
	food.clicked = false
	food.pellets = {}
	setmetatable(food, Food)
	return food
end

function Food:draw()
	if self.clicked then
		for _, v in pairs(self.pellets) do
			v:draw()
		end
	end

	love.graphics.circle("fill", 200, 50, 30)
	love.graphics.draw(self.pack_img, 200, 50, 0, 1, 1, self.pack_img:getWidth() / 2, self.pack_img:getHeight() / 2)
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

		local reached = {}
		for i, p in pairs(self.pellets) do
			p:update(dt, FISHES[i].x, FISHES[i].y)
			if p.reached then
				table.insert(reached, i, true)
			end
		end

		if #reached == #self.pellets then
			self.pellets = {}
		end
	end
end

function Food:checkClick(x, y)
	if CheckHitbox(x, y, 170, 20, 230, 80) and self.clicked == false then
		self.clicked = true
		for i = 1, #FISHES do
			table.insert(self.pellets, i, pellet:new())
		end
	end
end

return Food
