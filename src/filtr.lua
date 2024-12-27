local Filter = {}
Filter.__index = Filter

function Filter:new()
	local filter = {}
	-- 0 - 1 - 2
	-- none, mecha, bio
	filter.type = 2
	filter.strawberry = love.graphics.newImage("assets/strawberry.png")
	filter.bubble = love.graphics.newImage("assets/bubble.png")
	filter.bubbles = {}
	filter.acc = 1
	for _ = 1, 4 do
		table.insert(filter.bubbles, {
			x = love.math.random(trunc_w, Width - trunc_w),
			y = love.math.random(trunc_h + 20, Height - trunc_h - 20),
		})
	end

	setmetatable(filter, Filter)

	return filter
end

function Filter:update(dt)
	if self.type ~= 0 then
		if math.floor(self.acc) ~= math.floor(self.acc + dt) then
			for _, v in ipairs(self.bubbles) do
				if math.floor(self.acc) % 2 == 0 then
					v.x = v.x - 40
				else
					v.x = v.x + 40
				end
				v.y = v.y - 20
			end
			-- break 4x movement
			self.acc = math.floor(self.acc + dt)
		end
		self.acc = self.acc + (dt / 5)
	end
end

function Filter:draw()
	if self.type ~= 0 then
		for _, v in ipairs(self.bubbles) do
			love.graphics.draw(self.bubble, v.x, v.y, 0, 1, 1)
		end
	end

	if self.type == 2 then
		love.graphics.setColor(0, 0, 0)
		love.graphics.line(trunc_w, trunc_h, trunc_w + 20, trunc_h)
		love.graphics.line(trunc_w + 100, trunc_h, trunc_w + 120, trunc_h)
		love.graphics.line(Width - trunc_w - 100, trunc_h, Width - trunc_w, trunc_h)
		love.graphics.setColor(1, 1, 1)
		love.graphics.draw(
			self.strawberry,
			trunc_w + 150,
			trunc_h - 50,
			0,
			1,
			2,
			self.strawberry:getWidth() / 2,
			self.strawberry:getHeight() / 2
		)
		love.graphics.draw(
			self.strawberry,
			Width - trunc_w - 150,
			trunc_h - 50,
			0,
			1,
			2,
			self.strawberry:getWidth() / 2,
			self.strawberry:getHeight() / 2
		)
	end
end

-- type: 0 | 1 | 2
function Filter:change(type)
	self.type = type
end

return Filter
