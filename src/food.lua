local Food = {}
Food.__index = Food

local pellet = require("src.pellet")

function Food:new()
	local food = {}
	food.pack_img = love.graphics.newImage("assets/food.png")
	food.rad = -math.pi / 2
	food.pellets = {}
	food.clicked = false
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
	love.graphics.draw(
		self.pack_img,
		140 + (self.pack_img:getWidth() / 2),
		-15 + (self.pack_img:getHeight() / 2),
		0,
		1,
		1
	)
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

		if self.clicked then
			for _, fish in ipairs(FISHES) do
				for _, p in pairs(self.pellets) do
					p:update(dt, fish.x, fish.y)
				end
			end
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
