local Sidemenu = {}
Sidemenu.__index = Sidemenu

local button = require("src.ui.button")
function Sidemenu:new()
	local sidemenu = {}
	sidemenu.open = true

	fish_button = button:new(Width - Width * 0.1, 50, "assets/fish1.png")

	setmetatable(sidemenu, Sidemenu)
	return sidemenu
end

function Sidemenu:draw()
	if self.open then
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", Width - Width * 0.2, 0, Width * 0.2, Height)
		love.graphics.setColor(1, 1, 1)
		fish_button:draw()
	end
end

function Sidemenu:update() end

function Sidemenu:close_menu()
	self.open = false
end

return Sidemenu
