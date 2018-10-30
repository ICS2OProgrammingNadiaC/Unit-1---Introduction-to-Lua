 -----------------------------------------------------------------------------------------
-- Title: Whack A Mole
-- Name: Nadia Coleman
-- Course: ICS20
-- This program places an image on the screen. If the user clicks this image on time, 
-- their score increases by 1.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets the background colour
display.setDefault("background", 122/255, 27/255, 200/255)

-- creating the mole
local mole = display.newImage( "Images/mole.png" , 0, 0 )
	
	-- set the moles position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY
	mole:scale(1/3, 1/3)

	-- set the mole to be transparent
	mole.isVisible = false


---------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------
-- whack sound

local whackSound = audio.loadSound( "Sounds/whack.mp3" )
local whackSoundChannel
---------------------------------------------------------------------



-----------------------------------------------------------------------------------------
-- SCORE
-----------------------------------------------------------------------------------------

local score
local numberOfPoints = 0

-- display the score text
score = display.newText( "Score = " .. numberOfPoints, display.contentWidth/2, display.contentHeight/2, nil, 80)
score:setTextColor(100/255, 2/255, 4/255)

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- create a function that makes the mole appear at random places on the screen before 

-- create a function that makes the mole invisible and then calls the PopUpDelay function

-- calling the Hide Function
function PopUp()

	-- Choose the random position on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight )
	mole.isVisible = true
	timer.performWithDelay( 1000, Hide)

end

-- create a function that calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay( 2000, PopUp )
end

function Hide()

	-- change the mole visiblity
	mole.isVisible = false
	PopUpDelay()
end



-- create a function that begins the game
function GameStart()
	PopUpDelay()

end

-- create a function that increments the score but only if the mole is clicked. It then
-- displays the new score

function Whacked( event )

	-- if the touch phase just started
	if (event.phase == "began") then

		whackSoundChannel = audio.play(whackSound)

		numberOfPoints =  numberOfPoints + 1
		score.text = " Score = " .. numberOfPoints
		
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



---------------------------------------------------------------------
