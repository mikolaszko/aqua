function love.load()
	love.window.setFullscreen(true)
	FISH = require("src.fish")
	AQUARIUM = require("src.aquarium")
	FILTH = require("src.filth")
	love.graphics.setBackgroundColor(122 / 255, 122 / 255, 255 / 255)
	FISHES = {}

	aquarium = AQUARIUM:new(0.4, 0.4)
	for i = 1, 100 do
		table.insert(FISHES, FISH:new("assets/fish1.png", 40))
	end
end
function love.draw()
	for i, v in ipairs(FISHES) do
		v:draw()
	end
	aquarium:draw()
end

function love.update(dt)
	aquarium:update(dt)
	for i, v in ipairs(FISHES) do
		v:update(dt)
	end
end
