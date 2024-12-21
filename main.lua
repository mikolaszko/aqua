love.window.setFullscreen(true)
Width, Height = love.graphics.getDimensions()

FISH = require("src.fish")
AQUARIUM = require("src.aquarium")
FILTH = require("src.filth")
PLANT = require("src.plant")
MONEY = require("src.money")
SIDEMENU = require("src.sidemenu")
UTILS = require("src.util")
local aquarium = nil
local sidemenu = nil

MONEY_RES = nil

local bg = nil

function love.load()
	bg = love.graphics.newImage("assets/bg.jpeg")
	FISHES = {}
	PLANTS = {}

	MONEY_RES = MONEY:new()
	aquarium = AQUARIUM:new(0.4, 0.4)
	sidemenu = SIDEMENU:new()
end

function love.draw()
	love.graphics.draw(bg, Width / 2, Height / 2, 0, 1, 1, bg:getWidth() / 2, bg:getHeight() / 2)
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

function love.mousereleased(x, y)
	for _, v in ipairs(FISHES) do
		v:checkClick(x, y)
	end

	Fish_Button:checkClick(x, y)
end
