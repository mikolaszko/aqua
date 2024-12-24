local Filter = {}
Filter.__index = Filter

function Filter:new()
	local filter = {}
	-- 0 - 1 - 2
	-- none, mecha, bio
	filter.type = 2
	filter.strawberry = love.graphics.newImage("assets/strawberry.png")

	setmetatable(filter, Filter)

	return filter
end

function Filter:draw()
	if self.type == 2 then
		love.graphics.setColor(0, 0, 0)
		love.graphics.line(trunc_w, trunc_h, trunc_w + 20, trunc_h)
		love.graphics.line(trunc_w + 100, trunc_h, trunc_w + 120, trunc_h)
		love.graphics.line(Width - trunc_w - 100, trunc_h, Width - trunc_w, trunc_h)
		love.graphics.setColor(1, 1, 1)
		love.graphics.draw(
			self.strawberry,
			trunc_w + 150,
			trunc_h,
			0,
			1,
			2,
			self.strawberry:getWidth() / 2,
			self.strawberry:getHeight() / 2
		)
		love.graphics.draw(
			self.strawberry,
			Width - trunc_w - 150,
			trunc_h,
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
