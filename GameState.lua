--local stateSwitcher = require("StateSwitcher")
local world  = require("World")
local Entity = require("Entity")
local Hunter = require("Hunter")
local Rabbit = require("Rabbit")
local Base   = require("Base")
local Timer  = require("Timer")
local Player = require("Player")
local Ladder = require("Ladder")
local Audio  = require("Audio")
local Assets = require("Assets")
local backgroundMusic
local time
local timeLeft
local timeMinutes, timeSeconds
local GameState = {}

local function setGameAudio()
  backgroundMusic = Audio.levelAudio
  backgroundMusic:setVolume(0.25)
  backgroundMusic:setLooping(true)
end
local function endGame()
  backgroundMusic:stop()
 stateSwitcher.load( args,"EndState",RedBase:getScore(), BlueBase:getScore() )

end

function GameState.load( args )
    -- for zerobrane studio to debug (marc)
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    Entity._all = {}
    Player.reset()
    love.graphics.setBackgroundColor( 10, 30, 50 )
    world:init()
    RedBase = Base.new({team="red",  px=1206, py=70})
    BlueBase = Base.new({team="blue", px=130, py=95})
    local rabbit = Rabbit.new()
    rabbit:respawn()
    if table.getn(love.joystick.getJoysticks()) == 0 then
       Player.createKeyboardPlayer("red")
    end
    for n,j in ipairs(love.joystick.getJoysticks()) do
        if (n%2) == 0 then
            Player.createGamepadPlayer( j, "blue" )
        else
            Player.createGamepadPlayer( j, "red" )
        end
    end
    
    debuglog = debuglog.."\nEntity: "..table.getn(Entity._all)
    -- Set game time
    time = Timer.setTimer(endGame,300, 1)
    timeLeft = 0
    timeMinutes = 0
    timeSeconds = 0
    --Set game music and effects
    setGameAudio()
    backgroundMusic:play()
    
end


function GameState.update( dt )
    world:update(dt) 
    Timer.timerUpdate(dt)
    updateTimer()
    Player.update( dt )
    for _,e in ipairs(Entity._all) do
        e:update(dt)
    end 

    if string.len(debuglog) > 1000 then    -- cleanup when 'debuglog' gets too long
        debuglog = ""         
    end
end


function updateTimer()
  if time:isRunning() then 
    timeLeft = time:getDetails()
    timeMinutes = math.floor(timeLeft/60)
    timeSeconds = math.floor(timeLeft%60)
  end  
end


function GameState.draw()
    world:draw()
    
    for _,e in ipairs(Entity._all) do
        e:draw()
    end
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.setColor(0, 255, 0, 255)
    
    --Timer
    love.graphics.print(timeMinutes , 600, 50, 0, 3, 3.0 )
    if(timeSeconds >= 10)then 
      love.graphics.print(" : " , 615, 50, 0, 3, 3.0 )
      love.graphics.print(timeSeconds , 635, 50, 0, 3, 3.0 )
    else
      love.graphics.print(" :0" , 615, 50, 0, 3, 3.0 )
      love.graphics.print(timeSeconds , 660, 50, 0, 3, 3.0 )
    end
end

function GameState.keypressed( key, isrepeat )
    if key == "escape" then love.event.quit() end
    if key == "m" then
      volume = backgroundMusic:getVolume()
       if  volume > 0 then 
        backgroundMusic:setVolume(0)
      else backgroundMusic:setVolume(0.25) end
    end  
    Player.keypressed( key, isrepeat )
end



function GameState.keyreleased( key )
    Player.keyreleased( key )
end

function GameState.mousepressed( x, y, button )
end

function GameState.mousereleased( x, y, button )
end


function GameState.joystickpressed( joystick, button )
    Player.buttonpressed( joystick, button )
end

function GameState.joystickreleased( joystick, button )
    Player.buttonreleased( joystick, button )
end

return GameState

