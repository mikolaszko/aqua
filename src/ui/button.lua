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

return Button
