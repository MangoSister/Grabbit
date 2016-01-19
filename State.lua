-- *************************************************
-- *           		States for FSM                 *
-- *************************************************
local CLASS = require('Class')
local FsmCtl = require("FsmController")
local Entity = require("Entity")
require("Util")

-- abstract
local State = CLASS()
-- Lv0
local RootState = CLASS(State)
-- Lv1
local PatrolState = CLASS(State)
local FleeState = CLASS(State)
local PassiveState = CLASS(State)
-- Lv2
local NavigationState = CLASS(State)
-- Lv3
local RunState = CLASS(State)
local JumpState = CLASS(State)
local ClimbState = CLASS(State)
-- debug prupose
local WanderState = CLASS(State)

-- *************************************************
-- *           		abstract state                 *
-- *************************************************
State.name = "basic"
State.parentMachine = nil
State.childrenMachine = {}
State.agent = nil
State.entity = nil
-- action when entering a state, should be override
function State:enter() 
    assert(self.parentMachine)
    assert(self.agent)
    assert(self.entity)
    self.childrenMachine = {}
end

-- routine of a state, should be override
function State:execute(dt)
end

-- action when exiting a state, should be cascade exiting
-- should be override if needed, but must call the base class exit in the end
function State:exit()
    for _,child in ipairs(self.childrenMachine) do
        child:exitState()
    end
end

-- *************************************************
-- *                  root state  Lv0              *
-- *************************************************
RootState.name = "root"
RootState.actionFsm = nil
RootState.holes = nil
RootState.passive = false
-- ********************  override  *******************
function RootState:enter() 
    State.enter(self)

    self.actionFsm = FsmCtl.new()
    self.actionFsm:attach(self)
    table.insert(self.childrenMachine, self.actionFsm)

    if self.entity.wander then
        local wanderState = WanderState.new({entity = self.entity})
        self.actionFsm:changeState(wanderState)
    end

end

function RootState:execute(dt)
    if self.entity.wander then
        self.actionFsm:update(dt)
        return
    end
    -- what to do next?
    -- passive -> wait
    if self.passive and self.actionFsm.currState and self.actionFsm.currState.name == "passive" then return end
    if self.passive and (not self.actionFsm.currState or self.actionFsm.currState.name ~= "passive") then
        local passiveState = PassiveState.new({entity = self.entity})
        self.actionFsm:changeState(passiveState)
        return
    end
    -- on air -> wait
    local onground = self.entity:isOnGround()
    if not ( onground ) and (not self.actionFsm.currState or self.actionFsm.currState.name ~= "onair") then
        --self.entity:resetAnim()
        return
    end

    -- enemy too close -> flee
    -- should avoid jitter between flee and patrol
    local threatened = self.entity:isThreatened()
    if threatened and (not self.actionFsm.currState or self.actionFsm.currState.name ~= "flee") then
        local fleeState = FleeState.new({entity = self.entity})
        self.actionFsm:changeState(fleeState)
        return
    end

    -- safe and on ground -> find holes   
    -- sort the holes based on distance first
    if onground and (not threatened) and (not self.actionFsm.currState or self.actionFsm.currState.name ~= "patrol") then
        assert(self.holes)
        local indice = {}
        for i,h in ipairs(self.holes) do
            table.insert(indice,h)
        end
        local patrolState = PatrolState.new({entity = self.entity, nodeIndice = indice})
        self.actionFsm:changeState(patrolState)
    end

    self.actionFsm:update(dt)
end

function RootState:exit()
    return State.exit(self)
end

-- *************************************************
-- *                patrol state  Lv1              *
-- *************************************************
PatrolState.name = "patrol"
PatrolState.nodeIndice = {}
PatrolState.naviFsm = nil
-- ********************  override  *******************
function PatrolState:enter()
    State.enter(self)

    assert(self.nodeIndice and table.getn(self.nodeIndice)>=2)
    self:sortTarget()

    self.naviFsm = FsmCtl.new()
    self.naviFsm:attach(self)
    table.insert(self.childrenMachine, self.naviFsm)
    
    local naviState = NavigationState.new({entity = self.entity})
    --naviState.start = self.nodeIndice[1]
    naviState.start = world.navgraph:nearestNode(self.entity.px, self.entity.py)
    naviState.goal = self.nodeIndice[1]
    self.naviFsm:changeState(naviState)
    
    
end

function PatrolState:execute(dt)
    if not self.naviFsm.currState.next then
        table.insert(self.nodeIndice, table.remove(self.nodeIndice, 1))
        local naviState = NavigationState.new({entity = self.entity})
        naviState.start = world.navgraph:nearestNode(self.entity.px, self.entity.py)
        naviState.goal = self.nodeIndice[1]
        self.naviFsm:changeState(naviState)
    end
    self.naviFsm:update(dt)
end

function PatrolState:exit()
    return State.exit(self)
end

function PatrolState:sortTarget()
    local function sort(a,b)
        local dista = {}
        for _,e in ipairs(Entity._all) do
            if e.class == "Hunter" then
                table.insert(dista, eudist(e.px, e.py, world.navgraph.nodes[a].x, world.navgraph.nodes[a].y))
            end
        end 
        table.sort(dista)
        local hunterdista = dista[1]

        local distb = {}
        for _,e in ipairs(Entity._all) do
            if e.class == "Hunter" then
                table.insert(distb, eudist(e.px, e.py, world.navgraph.nodes[b].x, world.navgraph.nodes[b].y))
            end
        end 
        table.sort(distb)
        local hunterdistb = distb[1]

        if hunterdista >= 1.5 * self.entity.threatBound and
            hunterdistb >= 1.5 * self.entity.threatBound then
            local entitydista = eudist(self.entity.px, self.entity.py, world.navgraph.nodes[a].x, world.navgraph.nodes[a].y)
            local entitydistb = eudist(self.entity.px, self.entity.py, world.navgraph.nodes[b].x, world.navgraph.nodes[b].y)
            return entitydista < entitydistb
        else 
            return hunterdista < hunterdistb
        end
    end
    table.sort(self.nodeIndice,sort)
end
-- *************************************************
-- *                flee state  Lv1                *
-- *************************************************
FleeState.name = "flee"
FleeState.moveFsm = nil
FleeState.current = nil
FleeState.next = nil
-- ********************  override  *******************
function FleeState:enter() 
    State.enter(self)
    self.entity.body:setLinearVelocity(0,0)
    self.moveFsm = FsmCtl.new()
    self.moveFsm:attach(self)
    table.insert(self.childrenMachine, self.moveFsm)
    -- first goto a node
    self.next = world.navgraph:nearestNode(self.entity.px, self.entity.py)
    local run = RunState.new({entity = self.entity, target = world.navgraph.nodes[self.next]})
    self.moveFsm:changeState(run)
end


function FleeState:execute(dt)
    assert(self.next)
    local currPosx = self.entity.px
    local currPosy = self.entity.py   
    if eudist(currPosx, currPosy, world.navgraph.nodes[self.next].x, world.navgraph.nodes[self.next].y)
        <= 5 then

        self.current = self.next
        -- simply navigate to the reverse direction
        local bestedge = self:calcEscapeRoute()

        assert(bestedge)
        self.next = bestedge.next
        if bestedge.type == "run" then
            local run = RunState.new({entity = self.entity, target = world.navgraph.nodes[self.next]})
            self.moveFsm:changeState(run)
        elseif bestedge.type == "jump" then
            local jump = JumpState.new({entity = self.entity, target = world.navgraph.nodes[self.next]})
            self.moveFsm:changeState(jump)
        elseif type == "climb" then
            local climb = ClimbState.new({entity = self.entity, target = world.navgraph.nodes[self.next]})
            self.moveFsm:changeState(climb)
        end

    end

    self.moveFsm:update(dt)
end


function FleeState:exit()
    return State.exit(self)
end

function FleeState:calcEscapeRoute()
    local maxheur = 0, bestedge 
    for k,edge in pairs(world.navgraph.nodes[self.current].neighbors) do
        local heur =  self:fleeHeuristic(world.navgraph.nodes[edge.next])
        if heur > maxheur then
            maxheur = heur
            bestedge = edge
        end
    end
    return bestedge
end

function FleeState:fleeHeuristic(node)
    local dist = {}
    for _,e in ipairs(Entity._all) do
        if e.class == "Hunter" then
            table.insert(dist, eudist(e.px, e.py, node.x, node.y))
        end
    end 
    table.sort(dist)
    return dist[1]
end

-- *************************************************
-- *                passive state         Lv1      *
-- *************************************************
PassiveState.name = "passive"
-- ********************  override  *******************
function PassiveState:enter() 
    State.enter(self)
    self.entity:resetAnim()
    self.entity.body:setType("kinematic")
    self.entity.body:setLinearVelocity(0,0)
end

function PassiveState:execute(dt)
    -- body
end

function PassiveState:exit()
    -- body
     self.entity.body:setType("dynamic") -- TODO: maybe fail to set it back?
     return State.exit(self)
end

-- *************************************************
-- *             navigation state Lv2              *
-- *************************************************
NavigationState.name = "navigation"
NavigationState.start = nil
NavigationState.goal = nil
NavigationState.current = nil
NavigationState.next = nil
NavigationState.type = nil
NavigationState.path = nil
NavigationState.moveFsm = nil 
-- ********************  override  *******************
function NavigationState:enter()
    State.enter(self)
    assert(self.start, "start is nil")
    assert(self.goal, "goal is nil")
    self.path = world.navgraph:findPath(self.start,self.goal)
    assert(self.path, "path is nil")

    self.entity.body:setLinearVelocity(0,0)
    if not self.path[self.start] then -- alrealy at goal
        return -- self.parentMachine:changeState(WanderState.new())
    else
        self.current = nil
        self.next = self.start
        self.moveFsm = FsmCtl.new()
        self.moveFsm:attach(self)
        table.insert(self.childrenMachine, self.moveFsm)
        self.type = self.path[self.start].type
        local run = RunState.new({entity = self.entity, target = world.navgraph.nodes[self.next]})
        self.moveFsm:changeState(run)
    end
end

function NavigationState:execute(dt)
    local currPosx = self.entity.px
    local currPosy = self.entity.py
    if self:endCondition() then
        -- arrived at next node 
        self.current = self.next
        self.next = self.path[self.next]
        if not self.next then -- arrived at goal
            return 
        else
            self.type = self.next.type
            self.next = self.next.idx

            -- next action is run
            if self.type == "run" then
                local run = RunState.new({entity = self.entity, target = world.navgraph.nodes[self.next]})
                self.moveFsm:changeState(run)
            -- next action is jump
            elseif self.type == "jump" then
                local jump = JumpState.new({entity = self.entity, target = world.navgraph.nodes[self.next]})
                self.moveFsm:changeState(jump)
            -- next action is climb
            elseif self.type == "climb" then
                local climb = ClimbState.new({entity = self.entity, target = world.navgraph.nodes[self.next]})
                self.moveFsm:changeState(climb)
            end
        end

    end
 
    self.moveFsm:update(dt)
end

function NavigationState:exit()
    NavigationState.start = nil
    NavigationState.goal = nil
    NavigationState.next = nil
    NavigationState.path = nil
    return State.exit(self)
end

function NavigationState:endCondition()
    local currPosx = self.entity.px
    local currPosy = self.entity.py
    return eudist(currPosx, currPosy, world.navgraph.nodes[self.next].x, world.navgraph.nodes[self.next].y) <= 5
end
-- *************************************************
-- *                run state   Lv3                *
-- *************************************************
RunState.name = "run"
RunState.target = nil
RunState.maxSpeed = 200
-- ********************  override  *******************
function RunState:enter()
    State.enter(self)
    assert(self.target)
    self.entity:resetAnim()
end

function RunState:execute(dt)
    local entity = self.entity
    local currPosx = entity.px
    local currPosy = entity.py

    local _, g = world.physics:getGravity()
    local angle = angle(currPosx, currPosy, self.target.x, self.target.y)
    local currVelox, currVeloy = entity.body:getLinearVelocity()
    if currVelox * currVelox + currVeloy * currVeloy <= self.maxSpeed * self.maxSpeed then
        entity.body:applyForce(math.cos(angle) * 200, math.sin(angle) * 200 - g)
    else
        entity.body:setLinearVelocity(math.cos(angle) * self.maxSpeed, math.sin(angle) * self.maxSpeed)
    end

    -- animation
    if currVelox >= 0 then
        self.entity:setAnimDirection("right")
    else self.entity:setAnimDirection("left")
    end

end

function RunState:exit()
  return State.exit(self)
end

-- *************************************************
-- *                jump state     Lv3             *
-- *************************************************
JumpState.name = "jump"
JumpState.target = nil
function JumpState:enter()
    State.enter(self)
    assert(self.target)
    self.entity:resetAnim()
    --self.entity:playSound("jump")
    self.entity.body:setLinearVelocity(0,0)

    local entity = self.entity
    local currx = entity.px
    local curry = entity.py
    local _, g = world.physics:getGravity()
    local m = entity.body:getMass()
    
    local fx,fy = self:calcJump(currx, curry, self.target.x, self.target.y,25, m, g)

    entity.body:applyLinearImpulse(fx,fy)

end

function JumpState:execute(dt)
    local entity = self.entity
    local currPosx = entity.px
    local currPosy = entity.py
    local currVelox, currVeloy = entity.body:getLinearVelocity()
    -- animation
    if currVelox >= 0 and currVeloy <= 0 then
        self.entity:setAnimDirection("jumpupright")
    elseif currVelox >= 0 and currVeloy > 0 then 
        self.entity:setAnimDirection("jumpdownright")
    elseif currVelox <0 and currVeloy <=0 then
        self.entity:setAnimDirection("jumpupleft")
    else self.entity:setAnimDirection("jumpdownleft")
    end

    -- don't do anything when on air
    local objBelowleft = world:castRay(currPosx - 16, currPosy, currPosx - 16, currPosy + 20)
    local objBelowright = world:castRay(currPosx + 16, currPosy, currPosx + 16, currPosy + 20)
    if table.getn(objBelowleft) == 0 and table.getn(objBelowright) == 0 then
        return
    end
end

function JumpState:exit()
    return State.exit(self)
end

function JumpState:calcJump(currx, curry, targetx, targety, peakdh, m, g)
    local peaky = math.min(curry, targety) - peakdh
    local y1, y2, t1, t2
    local vx0, vy0
    local fx, fy
    
    y1 = curry - peaky
    y2 = targety - peaky

    vy0 = math.sqrt(2 * g * y1)
    t1 = math.sqrt(2 * y1 / g)
    t2 = math.sqrt(2 * y2 / g)
    vx0 = (targetx - currx) / (t1 + t2)

    fx = getImpulseForce(m,0,vx0)
    fy = getImpulseForce(m,0,vy0)
    
    return fx, -fy
end

-- *************************************************
-- *                climb state   Lv3              *
-- *************************************************
ClimbState.name = "climb"
ClimbState.target = nil
ClimbState.speed = 100
-- ********************  override  *******************
function ClimbState:enter() 
    State.enter(self)
    assert(self.target)
    self.entity:resetAnim()
    self.entity.body:setLinearVelocity(0,0)
end

function ClimbState:execute(dt)
    local entity = self.entity
    local currPosx = entity.px
    local currPosy = entity.py
    local angle = angle(currPosx, currPosy, self.target.x, self.target.y)
    --entity.body:setLinearVelocity(math.cos(angle) * self.speed, math.sin(angle) * self.speed)
    --entity.body:setLinearVelocity(0,-200)
    local _,g = world.physics:getGravity()
    local m = self.entity.body:getMass()
    entity.body:applyForce(0,-g * m * 30)

    if self.target.y <= self.entity.py then
        self.entity:setAnimDirection("climbup")
    else
        self.entity:setAnimDirection("climbdown")
    end
end

function ClimbState:exit()
    return State.exit(self)
end

-- *************************************************
-- *          wander state (debug prupose)         *
-- *************************************************
WanderState.name = "wander"

-- ********************  override  *******************
function WanderState:enter()
    State.enter(self)

    self.entity.vx = clamp(self.entity.vx, -400, 200)
    self.entity.vy = clamp(self.entity.vy, -400, 200)
end

function WanderState:execute(dt)
    --here we are going to create some keyboard events
    if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
        self.entity.body:applyForce(1000,0)
    elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
        self.entity.body:applyForce(-1000,0)
    end   
    if love.keyboard.isDown("up") then --press the up arrow key to fly
        self.entity.body:applyForce(0,-1000)
    elseif love.keyboard.isDown("down") then --press the left arrow key to push the ball to the left
        self.entity.body:applyForce(0,1000)
    end

    if love.keyboard.isDown("r") then
         self.entity:release("random")
    end

    if love.keyboard.isDown("c") then
         self.entity:setCarried()
    end

    if love.keyboard.isDown("h") then
         self.entity:setHooked()
    end
    self.entity.vx = clamp(self.entity.vx, -400, 200)
    self.entity.vy = clamp(self.entity.vy, -400, 200)
    self.entity.body:setLinearVelocity(self.entity.vx, self.entity.vy)
end

function WanderState:exit()
    return State.exit(self)
end

local states = 
    {
        rootState = RootState,
        patrolState = PatrolState,
        passiveState = PassiveState,

        navigationState = NavigationState,
        
        wanderState = WanderState,
    }

return states