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

