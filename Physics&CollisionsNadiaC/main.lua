-----------------------------------------------------------------------------------------
-- Title: Physics & Collisions
-- Name: Nadia Coleman
-- Course: ICS20
-- This program displays 6 differently shaped balls that bounce off of beams in different directions
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

-- display the beam and set the X/Y positions
local beam = display.newImageRect("Images/beam.png", 0, 0)
beam.x = display.contentCenterX / 5
beam.y = display.contentCenterY * 1.65

-- set the beam to be half the ipad height and 1/10th of the ipad height
beam.width = display.contentCenterX / 1
beam.height = display.contentCenterY * 1 / 10

-- rotate the beam so its on an angle
beam:rotate(45)

-- send it to the back layer
beam:toBack()

-- add to physics
physics.addBody(beam, "static", {friction=0.6, bounce=0.35})
-----------------------------------------------------------------------------------------



-- display the beam and set the X/Y positions
local beam2 = display.newImageRect("Images/beam.png", 0, 0)
-- move the second beam over
beam2.x = display.contentCenterX / 0.5
beam2.y = display.contentCenterY * 1.65

-- set the beams height and width
beam2.width = display.contentWidth
beam2.height = display.contentCenterY * 1 / 10

beam2:rotate(90)

-- send it to the back layer
beam2:toBack()

-- add to physics
physics.addBody(beam2, "static", {friction=0.6, bounce=0.7})

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------


-- create first ball
local function firstBall()	
	-- creation of the fisrt ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end
-----------------------------------------------------------------------------------------

-- create second ball
local function secondBall()	
	-- creation of the fisrt ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball2, {density=1.0, friction=0.2, bounce=1.0, radius=50})

	-- scale the ball to be half it's original size
	ball2:scale(2.0, 2.0)
end

---------------------------------------------------------------------

-- create third ball
local function thirdBall()	
	-- creation of the fisrt ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball3, {density=1.0, friction=0.3, bounce=1.0, radius=25})

	-- scale the ball to be half of its size it's original size
	ball3:scale(1.0, 1.0)
end

---------------------------------------------------------------------


-- create second ball
local function fourthBall()	
	-- creation of the fisrt ball
	local ball4 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball4, {density=1.4, friction=0.3, bounce=1.0, radius=25})

end

---------------------------------------------------------------------


-- create second ball
local function fifthBall()	
	-- creation of the fisrt ball
	local ball5 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball5, {density=1.0, friction=0.5, bounce=0.3, radius=25})

end

---------------------------------------------------------------------


-- create second ball
local function sixthBall()	
	-- creation of the fisrt ball
	local ball6 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball6, {density=1.0, friction=0.5, bounce=0.3, radius=25})
	-- scale the ball to be half of its size it's original size
	ball6:scale(1.0, 1.0)

end


---------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------

-- electronic sound
local backgroundSound = audio.loadSound( "Sounds/background.mp3")
local backgroundSoundChannel

backgroundSoundChannel = audio.play(backgroundSound)


---------------------------------------------------------------------
-- TIMER DELAYS
---------------------------------------------------------------------
-- call each function after a period of time
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay( 700, thirdBall)
timer.performWithDelay( 800, fourthBall)
timer.performWithDelay( 900, fifthBall)
timer.performWithDelay( 1000, sixthBall)