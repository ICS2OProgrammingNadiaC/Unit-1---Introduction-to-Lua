-- Area Rectangle/Circle
-- Name: Nadia
-- Course: ICS20/3C
-- This program displays an rectangle and diplays its area

-- create my local variables
local areaText
local textSize = 40
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local myCircle
local pi = 3.14
local radiusOfCircle = 7.43


-- set the background colour of my screen. Remember that colours are between 0 and 1
display.setDefault("background", 30/255, 130/255, 200/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and seets its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x =20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

--set the colour of the border
myRectangle:setFillColor (1, 0, 0)

-- set the colour of the rectangle
myRectangle:setStrokeColor(0, 0, 1)

--calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

--write the area on the screen. Take into consideration the size of the font when posistioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. "is" ..
	areaOfRectangle .. "pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 30
areaText.y = display.contentHeight/2

--set the colour of the newText
areaText:setTextColor(1, 1, 1)

local myCircle = display.newCircle( 600, 100, 95)

-- anchor the circle in the top left corner of the screen and seets its (x,y) position
myCircle.anchorX = 10
myCircle.anchorY = 0
myCircle.X = 20
myCircle.Y = 20

-- set the width of the border
myCircleStrokeWidth = 20

--set the colour of the circle
myCircle:setFillColor (0.9, 0.2, 0.3)

-- set the colour of the border
myCircle:setStrokeColor(0, 1, 2)
 
--calculate the area of the circle
    areaOfCircle = radiusOfCircle * radiusOfCircle * pi

--write the area on the screen. Take into consideration the size of the font when posistioning it on the screen
areaText = display.newText("The area of this circle with a radius of" .. radiusOfCircle .. "is \n" ..
	areaOfCircle .. "pixels².", 0, 600, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 20
areaText.x = 20
areaText.y = display.contentHeight/2

--set the color of the text
areaText:setTextColor(1, 1, 1)