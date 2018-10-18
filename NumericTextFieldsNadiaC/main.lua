-- Title: Numeric TextField
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

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2 
local userAnswer 
local userAnswer
local numberPoints = 0
local correctAnswer

-----------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------

-- Correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel

-- Incorrect Sounds
local incorrectSound = audio.loadSound( "Sounds/incorrectSound.mp3" )
local incorrectSoundChannel

-------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------


local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	-- set randomNumber2
	randomNumber2 = math.random(10, 20)
	-- set randomOperator
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

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end


local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then
		-- when the answer is submitted (enter key is pressed) set user's input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answers are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			

		    numberPoints = numberPoints + 1
		    correct.text = ( "Correct = " .. numberPoints)
			timer.performWithDelay(2000, HideCorrect)

		else incorrectObject.isVisible = true

			incorrectSoundChannel = audio.play(incorrectSound)
			
			timer.performWithDelay(2000, HideIncorrect)
		end
		-- clear text field
		event.target.text = ""
	end
end


------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------

-- displays a question and sets it colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/3, nil, 60 )
questionObject:setTextColor(130/255, 200/255, 3/255)

-- create the correct text object and make it invisable
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 60 )
correctObject:setTextColor(130/255, 30/255, 243/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisable
incorrectObject = display.newText( "Incorrect, try again!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(190/255, 20/255, 200/255)
incorrectObject.isVisible = false

-- display pointsObject
pointsObject = display.newRect( display.contentWidth/1, display.contentHeight/1, 1, 50 )

-- create numeric field
numericField = native.newTextField( display.contentWidth/3, display.contentHeight/2, 150, 50 )
numericField.inputType = "number"


-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- display the correctAnswerText
correct = display.newText( "" , 120, 100, nil, 50 )
correct:setTextColor(123/255, 200/255, 100/255)
correct.text = ( "Correct =" .. numberPoints)



-----------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
