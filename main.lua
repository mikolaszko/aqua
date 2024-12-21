love.window.setFullscreen(true)
Width, Height = love.graphics.getDimensions()

FISH = require("src.fish")
AQUARIUM = require("src.aquarium")
FILTH = require("src.filth")
PLANT = require("src.plant")
MONEY = require("src.money")
SIDEMENU = require("src.sidemenu")
local aquarium = nil
local sidemenu = nil

MONEY_RES = nil

function love.load()
	love.graphics.setBackgroundColor(122 / 255, 122 / 255, 255 / 255)
	FISHES = {}
	PLANTS = {}

	MONEY_RES = MONEY:new()
	aquarium = AQUARIUM:new(0.4, 0.4)
	sidemenu = SIDEMENU:new()
end

function love.draw()
	for _, v in ipairs(FISHES) do
		v:draw()
	end
	for _, v in ipairs(PLANTS) do
		v:draw()
	end

	MONEY_RES:draw()
	aquarium:draw()
	sidemenu:draw()
end

function love.update(dt)
	aquarium:update(dt)
	MONEY_RES:update(dt)
	for _, v in ipairs(FISHES) do
		v:update(dt)
	end
end
