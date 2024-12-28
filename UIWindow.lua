CLASS = require("middleclass.middleclass")

UIWindow = CLASS("UIWindow")

function UIWindow:init(text, x, y, width, height)
	self.titleBarHeight = 20
	self.borderColor = { 69 / 255, 106 / 255, 142 / 255 }
	self.mouseOffsetX, self.mouseOffsetY = 0, 0
	self.mouseX = love.mouse.getX()
	self.mouseY = love.mouse.getY()
	self.text = text
	self.windowX = x
	self.windowY = y
	self.width = width
	self.height = height
	self.elements = {}
end

function UIWindow:draw()
	love.graphics.setColor(self.borderColor[1], self.borderColor[2], self.borderColor[3])
	love.graphics.rectangle("line", self.windowX, self.windowY, self.width, self.height)
	love.graphics.print(self.text, self.windowX + 5, self.windowY)
	love.graphics.line(
		self.windowX,
		self.windowY + self.titleBarHeight,
		self.windowX + self.width,
		self.windowY + self.titleBarHeight
	)
	--Draw all the elements in self.elements
	for _, element in ipairs(self.elements) do
		element:draw()
	end
end

function UIWindow:addElement(element, x, y)
	element:setScreenPosition(x + self.windowX, y + self.windowY + self.titleBarHeight)
	print(#self.elements)
	self.elements[#self.elements + 1] = element
	print(#self.elements)
end

function UIWindow:getText() return self.text end

return UIWindow
