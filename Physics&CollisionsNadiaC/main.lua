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

-- Add to physics
physics.addBody(ground, "static", {friction=0.45, bounce=0.4})

-----------------------------------------------------------------------------------------

local beam = display.newImageRect("Images/beam.png", 0, 0)
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

-- set the beam to be half the ipad height and 1/10 th of the ipad height
beam.width = display.contentCenterX / 2
beam.height = display.contentCenterY * 1 / 10

-- rotate the beam so its on an angle
beam:rotate(45)

-- send it to the back layer
beam:toBack()

-- add to physics
physics.addBody(beam, "static", {friction=0.45, bounce=0.35})



-- create BKG
local bkg = display.newImage("Images/bkg.png", 0, 0)

	-- set the X and Y position
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- set the width/height of the bkg to the iPad
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	--send to back
	bkg:toBack()