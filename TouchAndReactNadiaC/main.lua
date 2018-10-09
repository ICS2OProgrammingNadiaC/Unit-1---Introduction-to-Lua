-- Title: Buttons in Lua
-- Name: Nadia Coleman
-- Course: ICS20
-- This program shows a blue button then, a red button appears when clicked.

-- set the background colour
display.setDefault ("background", 12/255, 99/255, 1/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visable
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create a red button, set its position and make it visable
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none 
-- Description: when blue button is clicked, it will make the text appear with a red button
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none 
-- Description: when red button is clicked, it will make the text appear and make the blue button disappear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		redButton.isVisible = true
		blueButton.isVisible = false
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then
		redButton.isVisible = false
		blueButton.isVisible = true
		textObject.isVisible = false
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)