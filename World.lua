local sti = require ("sti")
local Assets = require('Assets')
local CLASS = require('Class')
local NavGraph = require('NavGraph')
local World = CLASS()

function World:init()

	--physics world set up
	self.meter  = 32
    self.left   =  1*self.meter
    self.right  = 40*self.meter
    self.top    =  1*self.meter
    self.bottom = 25*self.meter -- NOTE(markus): actually 24, but this is a dirty hack to not destroy equally hacked isOnGround()
	love.physics.setMeter(self.meter) -- 1 meter = 32 px
	self.physics = love.physics.newWorld(0, 9.8 * self.meter, true) -- 9.8 m/s^2	
	self.physics:setCallbacks(beginContact);
	self.physics:setContactFilter(contactFilter)
	--Add tile map and its physics (static)
	self.map = sti.new('Assets/mapfinal') -- To use the old map, replace the arg with 'Assets/tiledtest_new'
  	--self.map = sti.new('Assets/tiledtest_new')
  	self.mapcollision = self.map:initWorldCollision(self.physics)

    --Add navigation graph for AI navigation
    self.navgraph = NavGraph.new()
    self.navgraph:import('Assets/navgraphFinal')
  	--self.navgraph:import('Assets/testgraph')
end

function beginContact(a, b, collide)
	--collide debug info
	local x1,y1,x2,y2 = collide:getPositions()
	local nx,ny = collide:getNormal()
	local dataA = a:getUserData()
	local dataB = b:getUserData()
	debuglog = debuglog.."\n".."Collide Callback: "
	if(dataA) then
	debuglog = debuglog.." a: "..dataA.class
	end
	if(dataB) then
	debuglog = debuglog.." b: "..dataB.class
	end
	if(x1) then
		debuglog = debuglog.." x1: "..x1
	end
	if(y1) then
		debuglog = debuglog.." y1: "..y1
	end
	if(x2) then
		debuglog = debuglog.." x2: "..x2
	end
	if(y2) then
		debuglog = debuglog.." y2: "..y2
	end
	
	debuglog = debuglog..", with a vector normal of: "..nx..", "..ny

    if a:getUserData().collides then a:getUserData():collides( b:getUserData() ) end
    if b:getUserData().collides then b:getUserData():collides( a:getUserData() ) end

end

function endContact(a, b, collide)
	if a:getUserData().collides then a:getUserData():collides( b:getUserData() ) end
    if b:getUserData().collides then b:getUserData():collides( a:getUserData() ) end
end

function contactFilter(fixtureA, fixtureB)
	-- one side collision between rabbit and platform
	local dataA = fixtureA:getUserData()
	local dataB = fixtureB:getUserData()
	if dataA.class == "Rabbit" and 
		dataB.class == "one" then
		if dataA.vy >= 0 then 
			return true
		else return false
		end
	elseif dataB.class == "Rabbit" and 
		dataA.class == "one" then
		if dataB.vy >= 0 then 
			return true
		else return false
		end
	end
	-- ignore collision between rabbit and ladder
	if (dataA.class == "Rabbit" and dataB.class == "Ladder") or
		(dataB.class == "Rabbit" and dataA.class == "Ladder") then
		return false
	end
	-- ignore collision between rabbit and spring
	if (dataA.class == "Rabbit" and dataB.class == "Spring") or
		(dataB.class == "Rabbit" and dataA.class == "Spring") then
		return false
	end
	return true
end
function World:update(dt)
	self.physics:update(dt)
	self.map:update(dt)
end

function World:draw()
	self.map:draw()
	self.map:drawWorldCollision(self.mapcollision)
end


local _RayCastResult = {}
local _RayCastMe = nil

local function _RayCastCallback( fixture, x, y, xn, yn, fraction )
    local hit = {
        obj = fixture:getUserData(),
        x = x,
        y = y,
        xn = xn,
        yn = yn,
        fraction = fraction,
    }
    if hit.obj == _RayCastMe then
    elseif fixture:isSensor() then
    else
        table.insert(_RayCastResult, hit)
    end
    return 0
end

function World:castRay( x1, y1, x2, y2, me )
    _RayCastResult = {}
    _RayCastMe = me
    self.physics:rayCast( x1, y1, x2, y2, _RayCastCallback )
    table.sort(_RayCastResult, function(a,b) return a.fraction < b.fraction end )
    return _RayCastResult
end

--function World:castProjectile

return World
