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
    self.bounds = { 1, 1 }
    self.screenPosition = { x, y }
    self.visible = true
    self.borderVisible = visible or false
end

function UIElement:setScreenPosition(x, y)
    self.screenPosition = { x, y }
end

function UIElement:draw()
    if self.visible then
        love.graphics.print(self.text, self.screenPosition[1], self.screenPosition[2])
        if self.borderVisible then
            love.graphics.rectangle('line', self.screenPosition[1], self.screenPosition[2], self.bounds[1], self.bounds[2])
        end
    end
end

function UIElement:borderType(visible)
    self.borderVisible = visible or self.borderVisible
    --Really needs more functionailty here
end

function UIElement:setBounds(width, height)
    self.bounds = { width, height }
end

function UIElement:setVisible(visible) self.visible = visible end --maybe not this way
function UIElement:isVisible() return self.visible end
function UIElement:getX() return self.x end
function UIElement:getY() return self.y end
function UIElement:getBounds() return self.bounds end

return UIElement
