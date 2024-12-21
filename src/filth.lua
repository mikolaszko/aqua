local Filth = {}
Filth.__index = Filth

function Filth:new()
	local filth = {}
	-- glass is usually very clean at the beginning
	filth.intensity = 0

	setmetatable(filth, Filth)
	return filth
end

function Filth:draw()
	love.graphics.setColor(15 / 255, 53 / 255, 3 / 255, self.intensity)

	love.graphics.rectangle("fill", trunc_w, trunc_h, Width - (2 * trunc_w), Height - (2 * trunc_h))
end

function Filth:update()
	local fish_pol = #FISHES * 2
	local plants_apol = #FISHES / #PLANTS * 100
	local filtration_apol = 1 / 500

	self.intensity = self.intensity + (fish_pol / plants_apol * filtration_apol)
end

return Filth
