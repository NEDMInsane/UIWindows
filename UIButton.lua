CLASS = require 'middleclass.middleclass'
UIElement = require 'UIElement'

UIButton = CLASS('UIButton', UIElement)

function UIButton:init(text, x, y, visible)
    UIElement:init(text, x, y, visible)
    self.elementType = ElementTypes[1]
    --Default button size is 15 x 10
    self.bounds = { 80, 15 }

    --Use the border to draw the button border
    self.borderVisible = true
end


return UIButton