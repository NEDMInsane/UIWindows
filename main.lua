UIWindow = require 'UIWindow'
UIElement = require 'UIElement'

local testWindow1 = UIWindow:new()
local testWindow2 = UIWindow:new()
local windows = {
	testWindow1,
	testWindow2
}
function love.load()
	windows[1]:init("Test1", 10, 10, 150, 150)
	windows[2]:init("Test2", 165, 10, 150, 150)

	local newLabel = UIElement:new()
	newLabel:init("Test Label", 0, 0)
	windows[1]:addElement(newLabel, 5, 5)

	local newLabel2 = UIElement:new()
	newLabel2:init("Test2 Label", 0, 0)
	windows[1]:addElement(newLabel2, 5, 15)
end

function love.draw()
	--love.graphics.print(testWindow:getText())
	for _, window in ipairs(windows) do
		window:draw()
	end

end

function love.update(dt)
	
end


