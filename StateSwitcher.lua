


local GameState = require("GameState")
local EndState = require("EndState")
local MenuState = require("MenuState")
local StateSwitcher = {}
local result


function StateSwitcher.load( args, state, redScore, blueScore )
  if state == "EndState" then 
    g_state = EndState
  elseif state == "GameState" then 
    g_state = GameState
  elseif state == "MenuState" then
    g_state = MenuState
  end
  g_state.load(args, redScore,blueScore)

end

function StateSwitcher.update( dt )
end

function StateSwitcher.draw()
end

function StateSwitcher.keypressed( key, isrepeat )
end


function StateSwitcher.keyreleased( key )
end

function StateSwitcher.mousepressed( x, y, button )
end

function StateSwitcher.mousereleased( x, y, button )
end

function StateSwitcher.joystickpressed( joystick, button )
    --backgroundMusic:stop()

end

function StateSwitcher.joystickreleased( joystick, button )
end

return StateSwitcher

