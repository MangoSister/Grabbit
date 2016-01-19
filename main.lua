  world = require("World")

local Entity = require("Entity")
local Hunter = require("Hunter")
local Rabbit = require("Rabbit")
local RedScore = 0
local BlueScore = 0

DEBUG = false
debuglog = ""
g_state = nil

stateSwitcher = require("StateSwitcher")


function love.load( args )
    stateSwitcher.load(args,"MenuState")
end

function love.update( dt )
    if string.len(debuglog) > 1000 then    -- cleanup when 'debuglog' gets too long
        debuglog = ""         
    end
    g_state.update( dt )
end

function love.draw()
    g_state.draw()
end

function love.keypressed( key, isrepeat )
    g_state.keypressed( key, isrepeat )
end

function love.keyreleased( key )
    g_state.keyreleased( key )
end

function love.mousepressed( x, y, button )
    g_state.mousepressed( x, y, button )
end

function love.mousereleased( x, y, button )
    g_state.mousereleased( x, y, button )
end

function love.joystickpressed( joystick, button )
    g_state.joystickpressed( joystick, button )
end

function love.joystickreleased( joystick, button )
    g_state.joystickreleased( joystick, button )
end
