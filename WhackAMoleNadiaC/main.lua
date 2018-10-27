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
	bkg.color = 100/255, 200/255, 90/255
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
-- display the users score
scoreText = display.newText( "" , 120, 100, nil, 50 )
scoreText:setTextColor(120/255, 70/255, 3/255)
scoreText.text = ( "Score = " .. score)

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- create a function that makes the mole appear at random places on the screen before 
-- calling the Hide Function
local function PopUp()

	-- Choose the random position on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight )
	mole.isVisible = true
	timer.performWithDelay( 500, HideFunction)

end

-- create a function that calls the PopUp function after 3 seconds
local function PopUpDelay()
	timer.performWithDelay( 3000, PopUp )
end

-- create a function that makes the mole invisible and then calls the PopUpDelay function
local function Hide()

	-- change the mole visiblity
	mole.isVisible = false
	PopUpDelay()
end

-- create a function that begins the game
local function GameStart()
	PopUpDelay()
end

-- create a function that increments the score but only if the mole is clicked. It then
-- displays the new score

local function Whacked( event )

	-- if the touch phase just started
	if (event.phase == "began") then
		score = score + 1
		scoreText.isVisible = true
	end
end

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------
-- add the event listeners to the mole to call the Whacked function when the mole is clicked

mole:addEventListener( "touch", Whacked )

-----------------------------------------------------------------------------------------
-- START GAME
-----------------------------------------------------------------------------------------
GameStart()