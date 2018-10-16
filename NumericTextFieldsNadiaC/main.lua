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

-- creat local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end

local function HideCorrect()
	correctObject.isVisable = false
	AskQuestion()
end