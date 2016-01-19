
local CLASS  = require('Class')
local Assets = require('Assets')
local Audio  = require('Audio')
local Entity = require('Entity')
local World  = require('World')

local Ladder = CLASS(Entity)

Ladder.class = "Ladder"

Ladder.type = "kinematic"
Ladder.nogravity = true
Ladder.shape = love.physics.newEdgeShape(0, 250, 0, -300)

function Ladder:init()
    self.body:setGravityScale(0)
    self.body:setSleepingAllowed(false)
    -- TODO(yang): make rabbit not colliding with ladder
    -- self.fixture:setSensor(true)
end

function Ladder:update(dt)
    Entity.update(self, dt)
    self.px, self.py = self.body:getPosition()
end

function Ladder:draw()
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.line(self.px, self.py+250, self.px, self.py-300)
end


function Ladder:collides(other)
    if other.class then
        print("Ladder: collides( " .. other.class .. " )")
    else
        print("Ladder: collides()")
    end
end

return Ladder
