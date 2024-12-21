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

local function checkHitbox(x, y, button_x1, button_x2, button_y1, button_y2)
	return x > button_x1 and x < button_x2 and y > button_y1 and y < button_y2
end

function love.mousereleased(x, y)
	if checkHitbox(x, y, Width - Width * 0.1, Width + 60, 50, 110) and MONEY_RES.amount > 5 and MONEY_RES ~= nil then
		MONEY_RES.amount = MONEY_RES.amount - 5
		table.insert(FISHES, FISH:new("assets/fish1.png", 40))
	end
end

return Button
