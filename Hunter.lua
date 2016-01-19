
-- a Hunter is an Entity
-- Hunters are the primary units that are controlled by the players
-- first and foremost it can have these controllers:
-- + DefaultController : normal controls from player
-- + JumpController    : Hunter is mid-air
-- + LadderController  : Hunter is on a ladder ( could be omitted )
-- + HookController    : Hunter connected with his own hook
-- + HookedController  : Hunter was hooked by another player
-- + JetpackController : Hunter is flying with his Flamethrower
-- + RabbitController  : Hunter has the rabbit



local CLASS  = require('Class')
local Assets = require('Assets')
local Audio  = require('Audio')
local Entity = require('Entity')
local World  = require('World')
local Hook   = require('Hook')
require("AnAL")


local Hunter     = CLASS(Entity)
local BaseCtl    = CLASS()
local DefaultCtl = CLASS(BaseCtl)
local RemoteCtl  = CLASS(BaseCtl)
local RabbitCtl  = CLASS(BaseCtl)
local HookingCtl = CLASS(BaseCtl)


-- *************************************************
-- *              The Hunter                       *
-- *************************************************


-- ********  common stuff *********

Hunter.DefaultController = DefaultCtl
Hunter.RemoteController  = RemoteCtl
Hunter.RabbitController  = RabbitCtl
Hunter.HookingController = HookingCtl

Hunter.class = "Hunter"

Hunter.type = "kinematic"
Hunter.sx = 14
Hunter.shape = love.physics.newRectangleShape(Hunter.sx, 32)

function Hunter:init()
    self.team = self.team or "blue"
    if self.team == "blue" then
        self.animLadder = newAnimation(Assets.hunterBlueLadder, 32, 32, 0.1, 0)
        self.animRight  = newAnimation(Assets.hunterBlueMoveRight, 32, 32, 0.1, 0)
        self.animLeft   = newAnimation(Assets.hunterBlueMoveLeft, 32, 32, 0.1, 0)
        self.animRabbitRight = newAnimation(Assets.hunterRabbitBlueRight, 32, 32, 0.1, 0)
        self.animRabbitLeft = newAnimation(Assets.hunterRabbitBlueLeft, 32, 32, 0.1, 0)
        self.animLadderRabbit = newAnimation(Assets.hunterRabbitBlueLeft, 32, 32, 0.1, 0)
        self.anim = self.animRight
    else
        self.animLadder  = newAnimation(Assets.hunterRedLadder, 32, 32, 0.1, 0)
        self.animRight   = newAnimation(Assets.hunterRedMoveRight, 32, 32, 0.1, 0)
        self.animRabbitRight = newAnimation(Assets.hunterRabbitRedRight, 32, 32, 0.1, 0)
        self.animRabbitLeft = newAnimation(Assets.hunterRabbitRedLeft, 32, 32, 0.1, 0)
        self.animLadderRabbit = newAnimation(Assets.hunterRabbitLadderRed, 32, 32, 0.1, 0)
        self.animLeft    = newAnimation(Assets.hunterRedMoveLeft, 32, 32, 0.1, 0)
        self.anim = self.animRight
    end
    if self.team == "blue" then 
      self.armRight = Assets.hunterBlueArmRight
      self.armLeft = Assets.hunterBlueArmLeft
    else
      self.armRight = Assets.hunterRedArmRight
      self.armLeft = Assets.hunterRedArmLeft
    end
    self.arm = self.armRight
    self.direction = self.direction or 90
    self.norabbit  = false
    self.body:setGravityScale(0)
    self.body:setSleepingAllowed(false)
end

function Hunter:update(dt)
    -- self.body:setActive(true)
    self:isOnGround(true)
    Entity.update(self, dt)
    
    self.body:setPosition(self.px, self.py)

    if self.norabbit then
        self.norabbit = self.norabbit - dt
        if self.norabbit < 0 then self.norabbit = false end
    end

    if self.pickup_rabbit then
        self:changeController("rabbit")
        self.rabbit = self.pickup_rabbit
        self.rabbit:setCarried()
        self.pickup_rabbit = nil
    end
    self.anim:update(dt)
end

function Hunter:draw()
    love.graphics.setColor(255, 255, 255, 255)
    if self.rabbit then
      if self:isOnLadder() then
        self.anim = self.animLadderRabbit
      else
        if self.direction > 180 then 
          self.anim = self.animRabbitLeft
          self.arm = self.armLeft
        elseif self.direction < 180 then 
          self.anim = self.animRabbitRight
          self.arm = self.armRight
        end
      end
    else 
      if self:isOnLadder() then
        self.anim = self.animLadder
      else
        if self.direction > 180 then 
          self.anim = self.animLeft
          self.arm = self.armLeft 
        elseif self.direction < 180 then
          self.anim = self.animRight
          self.arm = self.armRight
        end
      end   
    end
    if not (self.vx == 0) then
    elseif self:isOnLadder() and not (self.vy == 0) then
    else
      self.anim:reset()
    end
    if not self:isOnLadder() and not self.rabbit then 
      if self.direction == 180 then -- looking dow
          love.graphics.draw(self.arm, self.px+2, self.py-4, math.rad(self.direction-170), 1, 1, 8, 2)
      elseif self.direction == 0 then -- looking up
        love.graphics.draw(self.arm, self.px-2, self.py-8, math.rad(self.direction-170), 1, 1, 8, 2)
      elseif self.direction <180 then --looking right
        love.graphics.draw(self.arm, self.px+2, self.py-8, math.rad(self.direction-140), 1, 1, 8, 2)
      elseif self.direction > 180 then --looking left 
        love.graphics.draw(self.arm, self.px, self.py-4, math.rad(self.direction+140), 1, 1, 8, 2)
      end
    end
    self.anim:draw( self.px - 0.5*32, self.py - 0.5*self.sy, math.rad(0)) -- NOTE(markus): using image size here hardcoded
     
    if DEBUG then
        love.graphics.setColor(0, 255, 0, 255)
        love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
        love.graphics.setColor( 0, 0, 255 )
        love.graphics.line(self.px, self.py, self.px + 16*math.sin(math.rad(self.direction)), self.py - 16*math.cos(math.rad(self.direction)))
    end
end



-- ******* controllers ********

function Hunter:changeController(newController)
    if self.controller and ( self.controller == newController or self.controller.class == newController) then return end
    if self.controller then self.controller:detach() end
    if     newController == "default" then self.controller = Hunter.DefaultController.new()
    elseif newController == "running" then self.controller = self.DefaultController.new()
    elseif newController == "remote"  then self.controller = self.RemoteController.new()
    elseif newController == "rabbit"  then self.controller = self.RabbitController.new()
    elseif newController == "hooking" then self.controller = self.HookingController.new()
    end
    self.controller:attach(self)
end


function Hunter:updateDirection(velocity)
    if not self.controller then return end

    if self.controller.left then
        self.vx = -velocity
        if self.controller.up       then self.direction = 315
        elseif self.controller.down then self.direction = 225
        else                             self.direction = 270
        end
    elseif self.controller.right then
        self.vx = velocity
        if self.controller.up       then self.direction = 45
        elseif self.controller.down then self.direction = 135
        else                             self.direction = 90
      end
    else
        self.vx = 0
        if self.controller.up       then self.direction = 0
        elseif self.controller.down then self.direction = 180
        else                             -- self.direction = KEEP
        end
    end

    if self._onBouncer then
        self.vy = -700
        self.py = self.py - 3
        Audio.SpringAudio:play()
    elseif self:isOnLadder() then
        if self.controller.up then
            self.vy = -velocity + 50
        elseif self.controller.down then
            self.vy = velocity - 50
        else
            self.vy = 0
        end

    end
end



-- ****** collision and interaction handlers *******

function Hunter:collides(other)
    if DEBUG then
        if other.class then
            print("Hunter: collides( " .. other.class .. " )")
            debuglog = debuglog .. "\nHunter:collides(" .. other.class .. ")"
        else
            debuglog = debuglog .. "\nHunter:collides( static )"
        end
    end

    if other.class then
        if other.class == "Rabbit" then
            if not self.norabbit and self.controller.class == "default" then self.pickup_rabbit = other end
        elseif other.class == "Hunter" then
        end
    end
end


function Hunter:isOnGround(recompute)
    if recompute then 
        if self:isOnLadder(true) then
            self._onGround = false
        elseif self.vy < 0 then
            self._onGround = false
        else
            local shy = self.sy / 2  -- size half y
            local fr = 5.0 -- NOTE: > 1
            for _,h in ipairs(World:castRay(self.px+7, self.py, self.px+7, self.py+shy, self)) do  -- NOTE(markus): using roughly sx/2 here hardcoded
                if h.obj and h.obj.class == "Rabbit" then
                    if not self.norabbit and self.controller.class == "default" then self.pickup_rabbit = h.obj end
                else
                    if h.fraction < fr then fr = h.fraction end
                end
            end
            for _,h in ipairs(World:castRay(self.px-7, self.py, self.px-7, self.py+shy, self)) do
                if h.obj and h.obj.class == "Rabbit" then
                    if not self.norabbit and self.controller.class == "default" then self.pickup_rabbit = h.obj end
                else
                    if h.fraction < fr then fr = h.fraction end
                end
            end
            if fr > 1.0 then
                self._onGround = false
            else
                self._onGround =  1 + shy - (fr*shy)
            end
        end
    end

    return self._onGround
end


function Hunter:isOnLadder(recompute)
    if recompute then 
        self._onLadder = false
        self._onBouncer = false
        local r = World:castRay(self.px - self.sx/2, self.py, self.px + self.sx/2, self.py, self)
        for _,e in ipairs(r) do
            if e.obj and (e.obj.class == "Ladder") then
                self._onLadder = true
            elseif e.obj and (e.obj.class == "Spring") then
                self._onBouncer = true
            end
        end
        -- TODO(markus): very ugly hacky solution
        if not (self.controller.class == "remote") and not (self.controller.pulling) then
            self.nogravity = self._onLadder
        end
    end
    return self._onLadder
end


-- *************************************************
-- *             The BaseController                *
-- *************************************************


-- ****** default stuff ******

BaseCtl.class = "base"

function BaseCtl:init()
    self.hunter = nil
    self.left   = false
    self.right  = false
    self.up     = false
    self.down   = false
    self.timer  = false
end

function BaseCtl:attach( ent )
    self.hunter = ent
end

function BaseCtl:detach()
    self.hunter = nil
end

function BaseCtl:setTimeout(t) self.timer = t end

-- ****** important stuff ******

function BaseCtl:update( dt )
    if not self.hunter then return end
end

function BaseCtl:jump()
end

function BaseCtl:shot()
end



-- *************************************************
-- *           The DefaultController               *
-- *************************************************


-- ****** default stuff ******

DefaultCtl.class = "default"

-- ****** important stuff ******

function DefaultCtl:update( dt )
    if not self.hunter then return end
    self.hunter:updateDirection(170)
end

function DefaultCtl:jump()
    local hunter = self.hunter
    if hunter:isOnGround() then
        hunter.py = hunter.py - 1
        hunter.vy = -250
    end
end

function DefaultCtl:shot()
    self.hunter:changeController("hooking")
    Audio.effectHunterHook:play()
end



-- *************************************************
-- *           The RemoteController               *
-- *************************************************

RemoteCtl.class = "remote"

-- ****** important stuff ******

function RemoteCtl:update( dt )
    if self.timer then
        self.timer = self.timer - dt
        if self.timer < 0 then self.hunter:changeController("default") end
    end
end



-- *************************************************
-- *           The RabbitController                *
-- *************************************************


-- ****** default stuff ******

RabbitCtl.class = "rabbit"

function RabbitCtl:detach()
    if self.hunter.rabbit then
        self.hunter.rabbit:release("fixed", self.hunter.px + ((self.hunter.direction < 180) and -32 or 32), self.hunter.py)
        self.hunter.rabbit = nil
        self.hunter.norabbit = 1.5
    end
    self.hunter = nil
end


-- ****** important stuff ******

function RabbitCtl:update( dt )
    if not self.hunter then return end
    self.hunter:updateDirection(130)
end

function RabbitCtl:jump()
    local hunter = self.hunter
    if hunter:isOnGround() then
        hunter.py = hunter.py - 1
        hunter.vy = -250
    end
end

function RabbitCtl:shot()
    self.hunter:changeController("default")
end


-- *************************************************
-- *           The HookingController               *
-- *************************************************


-- ****** default stuff ******

HookingCtl.class = "hooking"

function HookingCtl:attach( ent )
    self.hunter = ent
    self.hook = Hook.new{owner = self.hunter}
    self.pulling = false
end

function HookingCtl:detach()
    if self.hook then self.hook:destroy() end
    self.pulling = false
    self.hunter = nil
end

-- ****** important stuff ******

function HookingCtl:update( dt )
    if not self.hunter then return end
    if not self.pulling then
        -- NOTE: limited control while shooting the hook
        if self.left then
            self.hunter.vx = -170
        elseif self.right then
            self.hunter.vx =  170
        else
            self.hunter.vx = 0
        end
    end
    if self.timer then
        self.timer = self.timer - dt
        if self.timer < 0 then self.hunter:changeController("default") end
    end
end

function HookingCtl:jump()
    if self.pulling then return end
    local hunter = self.hunter
    if hunter:isOnGround() then
        hunter.py = hunter.py - 1
        hunter.vy = -250
    end
end

function HookingCtl:shot()
    if self.hook.state == "throw" then self.hook.state = "pullback" end
end


return Hunter
