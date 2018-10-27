-----------------------------------------------------------------------------------------
-- Title: Whack A Mole
-- Name: Nadia Coleman
-- Course: ICS20
-- This program places an image on the screen. If the user clicks this image on time, 
-- their score increases by 1.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create the background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
	-- set background colour
	bkg.setBackground("background", 9/255, 200/255, 90/255)
	
	-- set position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0




