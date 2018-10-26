-- Title: Moving Images
-- Name: Nadia Coleman
-- Course: ICS20
-- This program displays a math question and asks the user to answer in a numeric textField
-- terminal.

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets the background colour
display.setDefault("background", 124/255, 230/255, 219/255)

-------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------------------------------

-- creat local variables
local questionObject

local correctObject
local incorrectObject
local gameOver

local numericField

local randomNumber1
local randomNumber2
local correctAnswer
local userAnswer

-- number of points and text object that displays it
local numberPoints = 0
local pointsObject

-- variables for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText

local countDownTimer

local lives = 5

local heart1
local heart2
local heart3
local heart4
local NumericTextField


-------------------------------------------------------------------------------------
-- SOUNDS
-------------------------------------------------------------------------------------

-- Correct Sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel

-- Incorrect Sound
local incorrectSound = audio.loadSound( "Sounds/incorrectSound.mp3" )
local incorrectSoundChannel

-------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------
-- ask questions on a constant repeat/ create endless questions in a local functions
local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	-- set random number 1
	randomNumber1 = math.random(0, 10)
	-- set random number 2
	randomNumber2 = math.random(0, 10)
	-- set random operators
	randomOperator = math.random(1, 3)

	if (randomOperator == 1) then
		correctAnswer = randomNumber1 * randomNumber2
		-- create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
		correctAnswer = randomNumber1 + randomNumber2
		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

 	elseif (randomOperator == 3) then
 		correctAnswer = randomNumber1 - randomNumber2
 		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	end	
end

local function HideIncorrect()
	-- hide the incorrect if the answer is correct
	incorrectObject.isVisible = false
	AskQuestion()
end

local function HideCorrect()
	-- hide the correct if the answer is incorrect
	correctObject.isVisible = false
	AskQuestion()
end



local function DecreaseLives()
	-- remove a heart every time the timer runs out
	if (lives == 4) then

		heart4.isVisible = false

		-- remove one heart when the lives is 3
	elseif (lives == 3) then

		heart3.isVisible = false

		-- remove another heart if lives is 2
	elseif (lives == 2) then

		heart2.isVisible = false

		-- remove another heart if lives is 1
	elseif (lives == 1) then

		heart1.isVisible = false
		gameOver.isVisible = true
		numericField.isVisible = false	
	end
	lives = lives - 1
end

local function UpdateTime()
	-- decrease the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = " Time = " .. secondsLeft

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1
		-- if there are no lives left, play a lose sound and display a lose image.
		incorrectSoundChannel = audio.play(incorrectSound)
		gameOver.isVisible = true
		numericField.isVisible = false
		-- cancel the timer and remove the fourth heart by making it invisible
		-- update the hearts
		DecreaseLives()
		-- call the function to ask a new question
		AskQuestion()

	end
end



-- create a function that asks the user a question constantly
local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then
		-- clear text field
		event.target.text = ""
	
	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user's input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answers are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay( 2000, HideCorrect )	
			numberPoints = numberPoints + 1
			pointsObject.text = ( "Points = " .. numberPoints)
			secondsLeft = totalSeconds
			UpdateTime()

		
			-- if the answer is incorrect
		else 
			--play an incorrect sound
			-- display incorrect text
			incorrectObject.isVisible = true			
			incorrectSoundChannel = audio.play(incorrectSound)
			timer.performWithDelay( 2000, HideIncorrect )
			
			-- remove a life if the users answer is incorrect
			DecreaseLives()
			secondsLeft = totalSeconds
			UpdateTime()
			
		end
		-- clear text field
		event.target.text = ""
	end
end

local function StartTimer()
	-- create an infinate timer
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end
-----------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------------

heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7


heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7


heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7


heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7

-- displays a question and sets it colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(130/255, 200/255, 3/255)

-- create the correct text object and make it invisable
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(130/255, 30/255, 243/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisable
incorrectObject = display.newText( "Incorrect, try again!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(190/255, 20/255, 200/255)
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "default"
-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- display the pointsObject
pointsObject = display.newText( "" , 120, 100, nil, 50 )
pointsObject:setTextColor(123/255, 200/255, 100/255)
pointsObject.text = ( "Points =" .. numberPoints)

-- clock object that holds time left
clockText = display.newText ( "", display.contentWidth/2, display.contentHeight *2.5/3, nil, 75 )
clockText:setTextColor( 149/255, 89/255, 100/255 )

-- create gameOver image and make it invisible
gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
gameOver.x = display.contentWidth * 1 / 2
gameOver.y = display.contentHeight * 1 / 2
gameOver.isVisible = false
-----------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

StartTimer()

DecreaseLives()

---cgcgcgcc