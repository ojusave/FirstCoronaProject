-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local tapCount = 0
local widget = require "widget"

local background = display.newImageRect( "background.jpg", 700,1075)
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 0, 0, 0 )

local platform = display.newImageRect( "panel.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local balloon = display.newImageRect( "baloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

local physics = require( "physics" )
physics.start()
 
physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )

local myButton=widget.newButton{
        --The id can be used to tell you what button was pressed in your button event
	id = "myTextButton",
        --This is the text label to put on the button
	label = "Reset",
        --This is the start x coordinate of the Top Left Corner
	left=150,
        --This is the start y coordinate of the Top Left Corner
	top=150,
        --Emboss can be true or false, tells it to make the label look embossed/inset
	emboss=true,
        --The border around the outside of the button
	strokeWidth=4,
        --How round to make the corners
	cornerRadius=8,
	--this tells it what function to call when you press the button
        onEvent = myButtonEvent
}


local function pushBalloon()
  balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
  tapCount = tapCount + 1
    tapText.text = tapCount
 
end

local myButtonEvent = function (event )
    if (event.phase == "release") then
        tapCount = 0
        tapText.text = tapCount
    end
end

balloon:addEventListener( "tap", pushBalloon )

