local UI = {}
UI.__index = UI

function UI:new()
	local ui = {}
	ui.o_fish = love.graphics.newImage("assets/fish1.png")
	ui.shrimp = love.graphics.newImage("assets/shrimp.png")
	ui.sidebar_open = false
	-- aquarium | fish
	ui.sidebar_mode = 0
	setmetatable(ui, UI)
	return ui
end

function UI:draw()
	-- sidebar section --
	if self.sidebar_open then
		love.graphics.setColor(122 / 255, 122 / 255, 122 / 255)
		love.graphics.rectangle("fill", Width - Width * 0.2, 0, Width * 0.2, Height)
		love.graphics.setColor(1, 1, 1)

		-- fish buttons
		love.graphics.rectangle("fill", Width - 100, 60, 60, 60, 5, 5)
		love.graphics.draw(
			self.o_fish,
			Width - 100 + (self.o_fish:getWidth() / 2),
			60 + (self.o_fish:getHeight() / 2),
			0,
			1,
			1
		)

		love.graphics.rectangle("fill", Width - 170, 60, 60, 60, 5, 5)
		love.graphics.draw(
			self.shrimp,
			Width - 170 + (self.shrimp:getWidth() / 2),
			60 + (self.shrimp:getHeight() / 2),
			0,
			1,
			1
		)
	end

	-- non sidebarsection
	if self.sidebar_open == false then
		love.graphics.line(Width - 30, 50, Width - 10, 50)
		love.graphics.line(Width - 30, 70, Width - 10, 70)
		love.graphics.line(Width - 30, 90, Width - 10, 90)
	end
end

function UI:update() end

function UI:checkClick(x, y)
	if self.sidebar_open then
		if CheckHitbox(x, y, Width - 100, 50, Width - 60, 120) and MONEY_RES.amount > 5 and MONEY_RES ~= nil then
			MONEY_RES.amount = MONEY_RES.amount - 5
			table.insert(FISHES, FISH:new("assets/fish1.png", 40))
		end

		if CheckHitbox(x, y, Width - 170, 50, Width - 110, 120) and MONEY_RES.amount > 3 and MONEY_RES ~= nil then
			MONEY_RES.amount = MONEY_RES.amount - 3
			table.insert(FISHES, FISH:new("assets/shrimp.png", 40))
		end
	else
		if CheckHitbox(x, y, Width - 40, 40, Width - 5, 100) then
			self.sidebar_open = true
		end
	end
end

return UI
