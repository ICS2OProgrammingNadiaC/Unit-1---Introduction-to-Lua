-- variables for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local lives = 4
local heart1
local heart2
local heart3
local heart4

-- local variables for the incorrect object, correct object, points object, points
local incorrectObject
local correctObject
local pointsObject
local points

---------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------

local function UpdateTime()
	-- decrease the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1
		-- if there are no lives left, play a lose sound and display a lose image.
		-- cancel the timer and remove the fourth heart by making it invisible
		if (lives == 3) then
			heart3.isVisible = false
		elseif (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisable = false
		end
		-- call the function to ask a new question
		AskQuestion()
	end
end

-- create a function to call the timer
local function startTimer()
	-- create an infinate timer
	countDownTimer = timer.performWithDelay( 1000, updateTime, 0)
end

