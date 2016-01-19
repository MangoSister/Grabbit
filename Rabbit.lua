local Assets = require("Assets")
local CLASS = require('Class')
local Entity = require("Entity")
local States = require("State")
local FsmCtl = require("FsmController")
local Audio = require("Audio")
require("AnAL")
local Rabbit = CLASS(Entity)
--local drawable = Assets.rabbitMoves

-- Rabbit.respawnPlace = 
-- {
--   39,41,43
-- }
Rabbit.rabbitHoles = 
{
  1,18,41
}
Rabbit.respawnPlace = Rabbit.rabbitHoles
Rabbit.class = "Rabbit" 
Rabbit.type = "dynamic"
Rabbit.carried = false
Rabbit.density = 1
Rabbit.friction = 0
Rabbit.threatBound = 150
Rabbit.wander = false
-- ***************** override ****************
function Rabbit:init()
    -- fsm  
    self.controller = FsmCtl.new()
    self.controller:attach(self)
    --self.body:setSleepingAllowed(false)

    -- animation
    self.animRight = newAnimation(Assets.rabbitMoveRight, 42, 42, 0.1, 0)
    self.animLeft = newAnimation(Assets.rabbitMoveLeft, 42, 42, 0.1, 0)
    self.animJumpUpRight = newAnimation(Assets.rabbitJumpUpRight, 42, 42, 0.1, 0)
    self.animJumpUpLeft = newAnimation(Assets.rabbitJumpUpLeft, 42, 42, 0.1, 0)
    self.animJumpDownRight = newAnimation(Assets.rabbitJumpDownRight, 42, 42, 0.1, 0)
    self.animJumpDownLeft = newAnimation(Assets.rabbitJumpDownLeft, 42, 42, 0.1, 0)
    self.animJumpRight = newAnimation(Assets.rabbitJumpRight, 42, 42, 0.1, 0)
    self.animJumpLeft = newAnimation(Assets.rabbitJumpLeft, 42, 42, 0.1, 0)
    self.frame = nil
    
    self.anim = self.animRight

    self.lastRespawnPlace = nil

end

function Rabbit:update(dt)
  if self:isArrivedHole() then
    self:respawn()
  end
	self.px, self.py = self.body:getPosition()
	self.vx, self.vy = self.body:getLinearVelocity()
	--debuglog = debuglog.."\nPos: "..self.px..", "..self.py
    self.controller:update(dt)
    self.anim:update(dt)
    self.frame = self.anim:getCurrentFrame()
    if self.anim == self.animJumpUpRight and self.frame == 2 then
      self.anim = self.animJumpRight
    elseif self.anim == self.animJumpDownRight and self.frame == 2 then
      self.anim = self.rabbitJumpDownRight
    elseif self.anim == self.animJumpUpLeft and self.frame == 2 then
      self.anim = self.animJumpLeft
    elseif self.anim == self.animJumpDownLeft and self.frame == 2 then
      self.anim = self.rabbitJumpDownLeft
    end
end

function Rabbit:draw()
	-- override
  if not self.carried then
  	love.graphics.setColor(255, 255, 255, 255)
    self.anim:draw(self.px - 0.5*self.sx, self.py - 0.5*self.sy-10, math.rad(0))
  	love.graphics.setColor(255, 0, 0, 255)

    if DEBUG then
        -- draw collision bound box
        love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
        love.graphics.setColor(255, 255, 255, 255)
    end
  end
  
end
-- ***************** feature ****************
function Rabbit:isOnGround()
  local objBelowleft = world:castRay(self.px - 0.5 * self.sx, self.py, self.px - 0.5 * self.sy, self.py + 20)
  local objBelowright = world:castRay(self.px + 0.5 * self.sx, self.py, self.px + 0.5 * self.sx, self.py + 20)
  if table.getn(objBelowleft) == 0 and table.getn(objBelowright) == 0 then
      return false
  else return true
  end
end

function Rabbit:isThreatened()
  for _,e in ipairs(Entity._all) do
      if e.class == "Hunter" then
          local dist = eudist(e.px, e.py, self.px, self.py)
          if dist <= self.threatBound then 
            return true
          end
      elseif e.class == "Base" then
          local dist = eudist(e.px, e.py, self.px, self.py)
          if dist <= self.threatBound + 50 then 
            return true
          end
      end
  end 
  return false
end

function Rabbit:isArrivedHole()
  if self.inHole then
    if eudist(self.px, self.py, 
      world.navgraph.nodes[Rabbit.respawnPlace[self.lastRespawnPlace]].x,
      world.navgraph.nodes[Rabbit.respawnPlace[self.lastRespawnPlace]].y) > 20 then
      self.inHole = false   
    else return false end
  end
  if not self.inHole then
    for i,nodeIdx in ipairs(Rabbit.rabbitHoles) do
      --if nodeIdx ~= self.lastRespawnPlace then
        local dist = eudist(self.px, self.py, world.navgraph.nodes[nodeIdx].x,world.navgraph.nodes[nodeIdx].y)
        if dist <= 20 then
          return true
        end
      --end
    end
  end
  return false
end

function Rabbit:setHooked()
  assert(self.controller.currState and  
         self.controller.currState.name == "root")

  self.controller.currState.passive = true

end

function Rabbit:moveHooked(x, y)
  assert(self.controller.currState.passive) -- only moved when passive
  self:rawMove(x,y)
end

function Rabbit:setCarried()
  assert(self.controller.currState and  
         self.controller.currState.name == "root")
  self.carried = true
  self.controller.currState.passive = true
  self.body:setActive(false)
end

function Rabbit:release(type, x, y)
  assert(type == "random" or type == "fixed")
  
  self.carried = false
  self.body:setActive(true)
  if type == "random" then
    return self:respawn()
  elseif type == "fixed" then
    return self:respawn(x,y)
  end
end

function Rabbit:respawn(x,y)
    local rootState = States.rootState.new({entity = self, holes = Rabbit.rabbitHoles})
    self.controller:changeState(rootState)
    self:rawSetVelo(0,0)
    if x and y then  
      self:rawMove(x,y)
    else
      local idx
      repeat
        idx = love.math.random(1,#Rabbit.respawnPlace)
      until idx ~= self.lastRespawnPlace
      self.lastRespawnPlace = idx
      self.inHole = true
      self:rawMove(world.navgraph.nodes[Rabbit.respawnPlace[idx]].x,world.navgraph.nodes[Rabbit.respawnPlace[idx]].y)
    end
end

function Rabbit:rawMove(x,y)
  assert (x and y)
  self.px = x
  self.py = y
  self.body:setPosition(self.px,self.py)
end

function Rabbit:rawSetVelo(vx, vy)
  assert(vx and vy)
  self.vx = vx
  self.vy = vy
  self.body:setLinearVelocity(self.vx, self.vy)
end

function Rabbit:setAnimDirection(dir)
  assert(dir == "left" or dir == "right" or dir == "climbup" or dir == "climbdown" or
   dir == "jumpupleft" or dir == "jumpupright" or dir == "jumpdownleft" or dir == "jumpdownright")
  if dir == "left" then
    self.anim = self.animLeft
  elseif dir == "right" then
    self.anim = self.animRight
  elseif dir == "jumpupleft" then
    self.anim = self.animJumpUpLeft
  elseif dir == "jumpupright" then
    self.anim = self.animJumpUpRight
  elseif dir == "jumpdownleft" then
    self.anim = self.animJumpDownLeft
  elseif dir == "jumpdownright" then
    self.anim = self.animJumpDownRight
  end
end

function Rabbit:playSound(type)
  assert(type == "jump", "invalid sound type")
  Audio.rabbitJumpAudio:play()
end

function Rabbit:resetAnim()
   self.anim:reset()
end

return Rabbit

-- a Rabbit is an Entity
-- Crazy beast!!!
