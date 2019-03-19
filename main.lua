local nOfToppingsTextField = native.newTextField( display.contentCenterX, display.contentCenterY + 100, 600, 110 )
nOfToppingsTextField.id = "n textField"

local toppingsTextField = display.newText( "Enter Number of Toppings", display.contentCenterX, display.contentCenterY - 10, native.systemFont, 90 )
toppingsTextField.id = "toppings textField"
toppingsTextField:setFillColor( 0, 0, 255 )

local LargeButton = display.newImageRect( "./LargeButton.JPG", 406, 157 )
LargeButton.x = display.contentCenterX
LargeButton.y = 1400
LargeButton.id = "large button"

local ExtraLargeButton = display.newImageRect( "./ExtraLargeButton.JPG", 406, 157 )
ExtraLargeButton.x = display.contentCenterX
ExtraLargeButton.y = 1600
ExtraLargeButton.id = "extra large button"

display.setDefault("background", 0, 255, 0)

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 2)
  return math.floor(num * mult + 0.5) / mult
end

local function calculatePrice( event )

	local tax = subtotal * 0.13
	local total = subtotal + tax
	local showSubtotal = display.newText( 'Subtotal: $' .. string.format("%.2f", subtotal), display.contentCenterX + 20, display.contentCenterY + -420, native.systemFont, 80 )
	showSubtotal:setTextColor( 0, 0, 255)
	local showTax = display.newText( 'Tax: $' .. string.format("%.2f", tax), display.contentCenterX + 20, display.contentCenterY + -620, native.systemFont, 80 )
	showTax:setTextColor( 0, 0, 255 )
	local showTotal = display.newText( 'Total: $' .. string.format("%.2f", total), display.contentCenterX + 20, display.contentCenterY + -820, native.systemFont, 80 )
	showTotal:setTextColor( 0, 0, 255 )
end

local function onLargeTouch( event )

	toppings = tonumber( nOfToppingsTextField.text )

	if toppings == 1 then
		subtotal = 6 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 6 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 6 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 6 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Too many toppings', display.contentCenterX + 20, display.contentCenterY + -620, native.systemFont, 80 )
		errorText:setTextColor( 0, 0, 255 )
	end	
end

local function onExtraLargeTouch( event )
	
	toppings = tonumber( nOfToppingsTextField.text )
	
	if toppings == 1 then
		subtotal = 10 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 10 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 10 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 10 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Too many toppings', display.contentCenterX + 20, display.contentCenterY + -620, native.systemFont, 80 )
		errorText:setTextColor( 0, 0, 255 )
	end	
end

LargeButton:addEventListener( 'touch', onLargeTouch)
ExtraLargeButton:addEventListener( 'touch', onExtraLargeTouch)

