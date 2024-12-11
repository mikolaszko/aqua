local Money = {}
Money.__index = Money

function Money:new()
	local money = {}
	money.amount = 0
	money.img = love.graphics.newImage("assets/dollar.png")
	setmetatable(money, Money)
	return money
end

function Money:draw()
	love.graphics.draw(self.img, width - 100, 30)
	love.graphics.print(self.amount, width - 50, 30)
end

function Money:update()
	self.amount = self.amount + 1
end

return Money
