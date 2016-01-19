
--local stateSwitcher = require("StateSwitcher")
local Entity = require("Entity")
local Assets = require("Assets")
local Audio = require("Audio")
local backgroundMusic = Audio.menuAudio

local MenuState = {}

function MenuState.load( args )
   if arg[#arg] == "-debug" then require("mobdebug").start() end
   Entity._all = {}
    love.graphics.setBackgroundColor( 10, 30, 50 )
    backgroundMusic:setLooping(true)
    backgroundMusic:play()
end




function MenuState.update( dt )
end

function MenuState.draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(Assets.startBackground, 0, 0)


    
end

function MenuState.keypressed( key, isrepeat )
    if key == "escape" then 
      love.event.quit() 
    end
    backgroundMusic:stop()
    stateSwitcher.load(args,"GameState")
end


function MenuState.keyreleased( key )
end

function MenuState.mousepressed( x, y, button )
end

function MenuState.mousereleased( x, y, button )
end

function MenuState.joystickpressed( joystick, button )
  backgroundMusic:stop()
  stateSwitcher.load(args,"GameState")

end

function MenuState.joystickreleased( joystick, button )
end

return MenuState

