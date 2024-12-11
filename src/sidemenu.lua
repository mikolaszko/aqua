local Sidemenu = {}
Sidemenu.__index = Sidemenu

local width, height = love.graphics.getDimensions()

local button = require("src.ui.button")
function Sidemenu:new()
	local sidemenu = {}
	sidemenu.open = true

	fish_button = button:new(width - width * 0.1, 50, "assets/fish1.png")

	setmetatable(sidemenu, Sidemenu)
	return sidemenu
end

function Sidemenu:draw()
	if self.open then
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", width - width * 0.2, 0, width * 0.2, height)
		love.graphics.setColor(1, 1, 1)
		fish_button:draw()
	end
end

function love.mousereleased(x, y)
	if checkHitbox(x, y) then
		table.insert(FISHES, FISH:new("assets/fish1.png", 40))
	end
end

function checkHitbox(x, y)
	return x > width - width * 0.1 and x < width + 60 and y > 50 and y < 110
end

function Sidemenu:update() end

return Sidemenu
