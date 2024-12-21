local Button = {}
Button.__index = Button

function Button:new(px, py, img_path)
	local button = {}
	button.px = px
	button.py = py
	button.img = love.graphics.newImage(img_path)

	setmetatable(button, Button)
	return button
end

function Button:draw()
	love.graphics.rectangle("fill", self.px, self.py, 60, 60, 5, 5)
	love.graphics.draw(self.img, self.px + (self.img:getWidth() / 2), self.py + (self.img:getHeight() / 2), 0, 1, 1)
end

function Button:update() end

function Button:checkClick(x, y)
	if CheckHitbox(x, y, Width - Width * 0.1, 50, Width + 60, 110) and MONEY_RES.amount > 5 and MONEY_RES ~= nil then
		MONEY_RES.amount = MONEY_RES.amount - 5
		table.insert(FISHES, FISH:new("assets/fish1.png", 40))
	end
end

return Button
