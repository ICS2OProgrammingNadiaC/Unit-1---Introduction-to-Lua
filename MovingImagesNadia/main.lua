-- Title: Images and Global Variables
-- Name: Nadia Coleman
-- Course: ICS20
-- This program displays and image that moves across the screen.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3






-- Funtion: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end



-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)	

-- character image with width and height 
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- set the image to be transparent
rocketship.alpha = 1

rocketship.xScale = -1 

-- set the initial x and y position of beetleship
rocketship.x = 1000
rocketship.y = display.contentHeight/7

-- Funtion: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveRocket(event)
	-- add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x - scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	rocketship.alpha = rocketship.alpha - 0.001
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveRocket)
