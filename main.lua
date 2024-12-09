function love.load()
    FISH = require("src.fish")
    AQUARIUM = require("src.aquarium")
    love.graphics.setBackgroundColor(122/255, 122/255, 255/255)
    love.window.setFullscreen(true)

    orange = FISH:new("assets/fish1.png", 40)
    aquarium = AQUARIUM:new();
end

function love.draw()
    orange:draw()
    aquarium:draw()
end

function love.update(dt)
    orange:update(dt)
end
