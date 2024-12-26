local Filth = {}
Filth.__index = Filth

-- bigger --
local font = love.graphics.newFont(30)
local label = love.graphics.newText(font, "Aquarium Polution")

function Filth:new()
	local filth = {}
	-- glass is usually very clean at the beginning
	filth.intensity = 0
	filth.fish_pol = (#FISHES + 0.01) / 200
	-- TODO: impl filter rate + algea eaters
	filth.apol = (#PLANTS + 0.01) * 100 / 1000
	setmetatable(filth, Filth)
	return filth
end

function Filth:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(label, 10, 100)
	local rate_text = love.graphics.newText(font, string.sub(self.intensity, 0, 5))
	love.graphics.draw(rate_text, 10, 150)
	love.graphics.setColor(15 / 255, 53 / 255, 3 / 255, self.intensity)
	love.graphics.rectangle("fill", trunc_w, trunc_h, Width - (2 * trunc_w), Height - (2 * trunc_h))
	love.graphics.setColor(1, 1, 1)
end

function Filth:update_polution()
	self.fish_pol = (#FISHES + 0.01) / 200
	self.apol = (#PLANTS + 0.1) * 100 / 1000
end

function Filth:update()
	if self.fish_pol > self.apol then
		self.intensity = self.intensity + (self.fish_pol / self.apol * 0.0001)
	else
		self.intensity = 0
	end
end

return Filth
