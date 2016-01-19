

-- a Player represents a physical player in front of the screen
-- it is responsible for input handling and dispatching the inputs to
-- the corresponding Hunter and its controller


local CLASS = require('Class')
local Hunter = require('Hunter')


local KeyboardPlayer = CLASS()
KeyboardPlayer._all = {}

function KeyboardPlayer:init()
    self.team   = self.team or "blue"
    self.spawnx = self.spawnx or 300
    self.spawny = self.spawny or  68
    self.hunter = self.hunter or Hunter.new({team=self.team, px=self.spawnx, py=self.spawny})
    self.left   = 'a'
    self.right  = 'd'
    self.up     = 'w'
    self.down   = 's'
    self.jump   = 'q'
    self.shot   = 'e'
end

function KeyboardPlayer:keypressed( key )
    if key == self.left  then self.hunter.controller.left = true end
    if key == self.right then self.hunter.controller.right = true end
    if key == self.up    then self.hunter.controller.up = true end
    if key == self.down  then self.hunter.controller.down = true end
    if key == self.jump  then self.hunter.controller:jump() end
    if key == self.shot  then self.hunter.controller:shot() end
end

function KeyboardPlayer:keyreleased( key )
    if key == self.left  then self.hunter.controller.left = false end
    if key == self.right then self.hunter.controller.right = false end
    if key == self.up    then self.hunter.controller.up = false end
    if key == self.down  then self.hunter.controller.down = false end
end




local GamepadPlayer = CLASS()
GamepadPlayer._all = {}

function GamepadPlayer:init()
    self.joystick = self.joystick
    self.team   = self.team or "blue"
    self.spawnx = self.spawnx or 300
    self.spawny = self.spawny or  68
    self.hunter = self.hunter or Hunter.new({team=self.team, px=self.spawnx, py=self.spawny})
    self.leftright = "leftx"
    self.updown    = "lefty"
    self.jump      = 1
    self.shot      = 6
end

function GamepadPlayer:buttonpressed( button )
    print(button)
    if button == self.jump then self.hunter.controller:jump() end
    if button == self.shot then self.hunter.controller:shot() end
end

function GamepadPlayer:buttonreleased( button )
end

function GamepadPlayer:update( dt )
    local leftright = self.joystick:getGamepadAxis( self.leftright )
    local updown    = self.joystick:getGamepadAxis( self.updown )
    if leftright > 0.5 then
        self.hunter.controller.right = true
        self.hunter.controller.left = false
    elseif leftright < -0.5 then
        self.hunter.controller.right = false
        self.hunter.controller.left = true
    else
        self.hunter.controller.right = false
        self.hunter.controller.left = false
    end

    if updown < -0.5 then
        self.hunter.controller.up = true
        self.hunter.controller.down = false
    elseif updown > 0.5 then
        self.hunter.controller.up = false
        self.hunter.controller.down = true
    else
        self.hunter.controller.up = false
        self.hunter.controller.down = false
    end
end





local Player = {}

function Player.reset()
    KeyboardPlayer._all = {}
    GamepadPlayer._all = {}
    Player.spawnsblue = {{ 100, 20},{ 160, 20}}
    Player.spawnsred  = {{1170, 20},{1230, 20}}
end

function Player.getSpawnpoint(team)
    if team == "red" then
        return table.remove(Player.spawnsred, 1)
    else
        return table.remove(Player.spawnsblue, 1)
    end
end

function Player.createKeyboardPlayer(team)
    local spawn = Player.getSpawnpoint(team)
    local p = KeyboardPlayer.new({team=team, spawnx=spawn[1], spawny=spawn[2]})
    table.insert(KeyboardPlayer._all, p)
    return p
end

function Player.createGamepadPlayer( joystick, team )
    local p = GamepadPlayer.new({joystick = joystick, team=team})
    table.insert(GamepadPlayer._all, p)
    return p
end

function Player.keypressed( key, isrepeat )
    if not isrepeat then
        for _,p in ipairs(KeyboardPlayer._all) do
            p:keypressed( key )
        end
    end
end

function Player.keyreleased( key )
    for _,p in ipairs(KeyboardPlayer._all) do
        p:keyreleased( key )
    end
end

function Player.buttonpressed( joystick, button )
    for _,p in ipairs(GamepadPlayer._all) do
        if p.joystick == joystick then p:buttonpressed( button ) end
    end
end

function Player.buttonreleased( joystick, button )
    for _,p in ipairs(GamepadPlayer._all) do
        if p.joystick == joystick then p:buttonpressed( button ) end
    end
end

function Player.update( dt )
    for _,p in ipairs(GamepadPlayer._all) do p:update( dt ) end
end



return Player
