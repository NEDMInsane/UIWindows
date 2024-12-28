CLASS = require 'middleclass.middleclass'

UIElement = CLASS('UIElement')

ElementTypes = {
    'Button',
    'Label',
    'TextBox'
}

function UIElement:init(text, x, y, visible)
    self.elementType = ElementTypes[2]
    self.text = text
    self.x = x
    self.y = y
    self.bounds = { x, y }
    self.screenPosition = {}
    self.visible = visible or true
end

function UIElement:setScreenPosition(x, y)
    self.screenPosition = { x, y }
end

function UIElement:draw()
    love.graphics.print(self.text, self.screenPosition[1], self.screenPosition[2])    
end

function UIElement:borderType(visible)
    self.visible = visible or self.visible
    if visible then
        love.graphics.rectangle('line', self.x, self.y)
    end
end

function UIElement:setVisible(visible) self.visible = visible end
function UIElement:isVisible() return self.visible end
function UIElement:getX() return self.x end
function UIElement:getY() return self.y end
function UIElement:getBounds() return self.bounds end

return UIElement
