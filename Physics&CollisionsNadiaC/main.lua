-----------------------------------------------------------------------------------------
-- Title: Physics & Collisions
-- Name: Nadia Coleman
-- Course: ICS20
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
-----------------------------------------------------------------------------------------
-- Objects
-----------------------------------------------------------------------------------------

-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)

ground.x = display.contentWidth/2
ground.y = display.contentHeight
-- change the width of the ground to be the same as the screen
ground.width = display.contentWidth



