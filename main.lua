function love.load()
	love.window.setFullscreen(true)
	FISH = require("src.fish")
	AQUARIUM = require("src.aquarium")
	FILTH = require("src.filth")
	PLANT = require("src.plant")
	MONEY = require("src.money")
	SIDEMENU = require("src.sidemenu")
	love.graphics.setBackgroundColor(122 / 255, 122 / 255, 255 / 255)
	FISHES = {}
	PLANTS = {}

	aquarium = AQUARIUM:new(0.4, 0.4)
	money = MONEY:new()
	sidemenu = SIDEMENU:new()
end

function love.draw()
	for _, v in ipairs(FISHES) do
		v:draw()
	end
	for _, v in ipairs(PLANTS) do
		v:draw()
	end
	money:draw()
	aquarium:draw()
	sidemenu:draw()
end

function love.update(dt)
	aquarium:update(dt)
	money:update(dt)
	for _, v in ipairs(FISHES) do
		v:update(dt)
	end
end
