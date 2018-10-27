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
	bkg = 9/255, 200/255, 90/255
	
	-- set position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0


-- creating the mole
local mole = display.newImage( "Images/mole.png" , 0, 0 )
	
	-- set the moles position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY
	mole:scale(3.0, 3.0)

	-- set the mole to be transparent
	mole.alpha = 0

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------
local score = 0

score = display.newText( "" , 120, 100, nil, 50 )
score:setTextColor(120/255, 70/255, 3/255)
score.text = ( "Score = " .. score)


