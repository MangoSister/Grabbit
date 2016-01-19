

-- basic entity class
-- all entities must:
-- + be movable
-- + draw themselves
-- + be animatable
-- + be controllable by a single controller at a time
-- + collide

local CLASS = require('Class')
local Assets = require('Assets')
local World = require('World')
local Entity = CLASS()

Entity._all = {}

Entity.class = "Entity"

function Entity:init()
    table.insert(Entity._all, self)
    
    -- position
    self.px = self.px or 500
    self.py = self.py or 400
    -- size
    self.sx = self.sx or 32
    self.sy = self.sy or 32
    -- velocity
    self.vx = self.vx or 0
    self.vy = self.vy or 0
    -- dynamics
    self.animation = self.animation or "idle"
    self.animation_time = self.animation_time or 0.0
    -- physics

    if not self.nophysics then
        self.type = self.type or "dynamic"
        assert(self.type == "dynamic" or self.type == "kinematic")
        self.body = love.physics.newBody(World.physics, self.px, self.py, self.type)
        self.shape = self.shape or Assets.rectangleShape
        self.density = self.density or 1
        self.fixture = love.physics.newFixture(self.body, self.shape, self.density)
        self.friction = self.friction or 1
        self.fixture:setFriction(self.friction)
        self.fixture:setUserData(self)
        if self.isSensor then
            self.fixture:setSensor(true)
        end
        self.body:setFixedRotation(true) -- fixed rotation
    end

    -- controller
    self:changeController('default')
end


function Entity:destroy()
    for i,v in ipairs(Entity._all) do
        if v == self then table.remove(Entity._all, i) end
    end
end


function Entity:update(dt)
    if self.controller then self.controller:update( dt ) end 
    if not self.nogravity then
        if self:isOnGround() then
            -- reset
            self.vy = 0
            self.py = self.py - self:isOnGround() + 2 -- let them be 1 px into the ground for more stable results in isOnGround()
        else
            self.vy = self.vy + (dt*(500 - self.vy))
        end
        for _,e in ipairs(World:castRay(self.px - self.sx/2 + 10, self.py + self.sy/2 - 3, self.px - self.sx/2, self.py + self.sy/2 - 3, self)) do
            if e.obj and (e.obj.class == "two") then self.vx = math.max(0,self.vx); self.px = self.px + math.min(3, (1.0-e.fraction)*10) end
        end
        for _,e in ipairs(World:castRay(self.px + self.sx/2 - 10, self.py + self.sy/2 - 3, self.px + self.sx/2, self.py + self.sy/2 - 3, self)) do
            if e.obj and (e.obj.class == "two") then self.vx = math.min(0,self.vx); self.px = self.px - math.min(3, (1.0-e.fraction)*10) end
        end
    end
    local shx = self.sx / 2
    local shy = self.sy / 2
    if self.px-shx < World.left   then self.px = World.left+shx;   self.vx =  5 end
    if self.px+shx > World.right  then self.px = World.right-shx;  self.vx = -5 end
    if self.py-shy < World.top    then self.py = World.top+shy;    self.vy =  5 end
    if self.py+shy > World.bottom then self.py = World.bottom-shy; self.vy = -5 end
    self.px = self.px + ( self.vx * dt )
    self.py = self.py + ( self.vy * dt )
end


function Entity:draw()
    love.graphics.setColor( 255, 0, 0 )
    love.graphics.rectangle( "fill", self.px - 0.5*self.sx, self.py - 0.5*self.sy, self.sx, self.sy )
end


function Entity:animate(animname, loop)
end


function Entity:changeController(newController)
    -- overwritten by subclasses
end


function Entity:isOnGround()
    -- we do a real hack here, so 
    -- isOnGround() always returns the current penetration depth + 1 if on ground and false otherwise
    return 1
end


function Entity:collides(other)
end




return Entity


