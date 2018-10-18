-- Name: Nadia Coleman
-- Course: ICS20
-- This program displays Hello, World on the iPad simulator and "Hellooooooo" to the command
-- terminal.
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("***Hellooooooooooooo")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the backround color
display.setDefault("background", 124/255, 249/255, 199/255)

-- create a local variables
local textObject
local textGreeting


-- displays text on the screen at posistion x = 500 and y = 500 with 
-- a default font style and font size of 50
textObject = display.newText( "Hello, Nadia!", 500, 300, nil, 100)
textGreeting = display.newText( "By: Nadia Coleman", 600, 400, nil,50)

-- sets the color of the text
textObject:setTextColor(155/255, 42/255, 198/255)

--------------------------------------------------------------------------------------------
-- SOUNDS
--------------------------------------------------------------------------------------------

-- Cricket sound
local cricketSound = audio.loadSound( "Sounds/cricket.mp3" )
local cricketSoundChannel

-- begin to play the music
cricketSoundChannel = audio.play(cricketSoundMusic)


-- Correct sound
local cricketsSound = audio.loadSound( "Sounds/crickets.mp3" )
local cricketsSoundChannel
cricketSoundChannel = audio.play(cricketSound)
