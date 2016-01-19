


local Entity = require("Entity")
local Assets = require("Assets")
local Audio = require("Audio")
local EndState = {}
local result
local backgroundMusic = Audio.menuAudio


function EndState.load( args, redScore, blueScore )
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  backgroundMusic:setLooping(true)
  backgroundMusic:play()
  love.graphics.setBackgroundColor( 10, 30, 50 )
  if redScore > blueScore then
    result = 'red'
  elseif blueScore > redScore then
    result = 'blue'
  else result = 'tie'
  end
end

function EndState.update( dt )
end

function EndState.draw()
  love.graphics.setColor(255, 255, 255, 255)
  if result == 'red' then
    love.graphics.draw(Assets.endRedTeamWins, 0, 0)
  elseif result == 'blue' then
    love.graphics.draw(Assets.endBlueTeamWins, 0, 0)
  else 
    love.graphics.draw(Assets.endTie, 0, 0)
  end    
end

function EndState.keypressed( key, isrepeat )
  if key == "escape" then love.event.quit()
  elseif key == "q"      then love.event.quit() 
  --elseif key == "p"      then
  end
  backgroundMusic:stop()
  stateSwitcher.load( args,"GameState")
end


function EndState.keyreleased( key )
end

function EndState.mousepressed( x, y, button )
end

function EndState.mousereleased( x, y, button )
end

function EndState.joystickpressed( joystick, button )
     backgroundMusic:stop()
     stateSwitcher.load( args,"MenuState")


end

function EndState.joystickreleased( joystick, button )
end

return EndState

