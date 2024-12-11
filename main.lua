function love.load()
	love.window.setFullscreen(true)
	FISH = require("src.fish")
	AQUARIUM = require("src.aquarium")
	FILTH = require("src.filth")
	PLANT = require("src.plant")
	love.graphics.setBackgroundColor(122 / 255, 122 / 255, 255 / 255)
	FISHES = {}
	PLANTS = {}

	aquarium = AQUARIUM:new(0.4, 0.4)

	for _ = 1, 5 do
		table.insert(PLANTS, PLANT:new("assets/plant1.png"))
	end

	for _ = 1, 100 do
		table.insert(FISHES, FISH:new("assets/fish1.png", 40))
	end
end
function love.draw()
	for _, v in ipairs(FISHES) do
		v:draw()
	end
	for _, v in ipairs(PLANTS) do
		v:draw()
	end
	aquarium:draw()
end

function love.update(dt)
	aquarium:update(dt)
	for _, v in ipairs(FISHES) do
		v:update(dt)
	end
end
