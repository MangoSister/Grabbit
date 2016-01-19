
local CLASS  = require('Class')
local Assets = require('Assets')
local Audio  = require('Audio')
local Entity = require('Entity')
local World  = require('World')

local Base   = CLASS(Entity)

Base.class = "Base"

Base.nophysics = true
Base.nogravity = true
local rabbitHomeBase = newAnimation(Assets.rabbitInHomeBase, 42, 42, 0.1, 0)
local homeBase = newAnimation(Assets.homeBase, 64, 64, 0.1, 0)
local frame 


function Base:getScore()
  return self.score
end


function Base:init()
    self.team = self.team or "blue"
    self.anim = homeBase
    self.sx        = 64
    self.sy        = 64
    self.score     = 0
    self.body      = love.physics.newBody(World.physics, self.px, self.py, "dynamic")
    self.shape     = Assets.rectangleShape
    self.fixture   = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
    self.body:setFixedRotation(true) -- fixed rotation
    self.body:setGravityScale(0)
    self.fixture:setSensor(true)
end

function Base:update(dt)
    Entity.update(self, dt)
    self.px, self.py = self.body:getPosition()
    -- self.body:setPosition(self.px, self.py)
    self.anim:update(dt)
    frame = self.anim:getCurrentFrame()
    if self.anim == rabbitHomeBase and frame == 5 then
      self.anim:reset()
      self.anim = homeBase
      
    end
    if self.rabbit then
        self.rabbit:setCarried(false)
        self.rabbit:setHooked(false)
        self.rabbit:release( "random" )
        self.rabbit = nil
    end
end

function Base:draw()
    
    if self.team == "blue" then
        love.graphics.setColor(0, 0, 255, 255)
    else
        love.graphics.setColor(255, 0, 0, 255)
    end
    
    love.graphics.draw( Assets.homeBase, self.px - self.sx/2, self.py - self.sy/2 )
    love.graphics.setColor(255, 255, 255, 255)
    if self.anim == rabbitHomeBase then 
      self.anim:draw(self.px - self.sx/2 + 15, self.py - self.sy/2 +5)
    end
    

    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print( self.score, self.px - 13, self.py-13, 0, 2, 2.0 ) -- TODO(markus): center
end


function Base:collides(other)
    if DEBUG then
        if other.class then
            print("Base: collides( " .. other.class .. " )")
        else
            print("Base: collides()")
        end
    end
    if other.class then
        if other.class == "Rabbit" then
            self.score = self.score + 1
            self.anim = rabbitHomeBase
            self.anim:setSpeed(2.5)
            if self.team == "blue" then
              Audio.effectScoreBlue:play()
            else 
              Audio.effectScoreRed:play()
            end
            self.rabbit = other
        elseif other.class == "Hunter" then
            if other.rabbit then
                self.score = self.score + 1
                if self.team == "blue" then
                  Audio.effectScoreBlue:play()
                else 
                  Audio.effectScoreRed:play()
                end
                self.anim = rabbitHomeBase
                self.anim:setSpeed(2.5)
                self.rabbit = other.rabbit
                other.rabbit = nil
                other:changeController("default")
            end  
      end
    end
end

return Base
