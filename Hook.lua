-- a Hook is the first weapon of a Hunter
-- it can be used to move around the map like in liero,
-- to fight other Hunters,
-- to grab the Rabbit
-- and to interact with the environment


local CLASS  = require('Class')
local Assets = require('Assets')
local World  = require('World')
local Entity = require('Entity')

local Hook = CLASS(Entity)

Hook.class = 'Hook'

Hook.nophysics = true

function Hook:init()
    self.direction = self.owner.direction
    self.mx        = math.sin(math.rad(self.direction))
    self.my        = -math.cos(math.rad(self.direction))
    self.x         = self.owner.px + (self.owner.sx/2 * self.mx)
    self.y         = self.owner.py + (self.owner.sy/2 * self.my)
    self.length    = 0
    self.state     = "throw"
    self.target    = nil
end


function Hook:update(dt)
    if not (self.state == "owner") then
        self.x = self.owner.px + ((self.owner.sx/2 + self.length)*self.mx)
        self.y = self.owner.py + ((self.owner.sx/2 + self.length)*self.my)
    end

    if self.state == "throw" then
        self.length = self.length + 500*dt

        if self.length > 500 then self.state="pullback" end

        local r = World:castRay(self.x - (25*self.mx), self.y - (25*self.my), self.x, self.y, self)
        if #r > 0 then 
            if r[1].obj == self.owner then table.remove(r, 1) end
            if #r == 0 then
                -- do nothing
            elseif not r[1].obj.class or r[1].obj.class == 'two' or r[1].obj.class == 'one' then
                if self.length > 20 then
                    -- hooking to world
                    self.state = "owner"
                    self.x = r[1].x
                    self.y = r[1].y
                    self.owner.nogravity = true
                    self.owner.controller.pulling = true
                    self.owner.vx = self.mx * 500
                    self.owner.vy = self.my * 500
                else
                    self.state="pullback"
                end
            elseif r[1].obj.class == 'Rabbit' then
                -- hooking Rabbit
                self.state = "rabbit"
                self.target = r[1].obj
                self.target:setHooked()
            elseif r[1].obj.class == 'Hunter' then
                -- hooking other Hunter
                self.target = r[1].obj
                self.state = "hunter"
                self.target.nogravity = true
                if self.target.team == self.owner.team then
                    local rabbit = self.target.rabbit
                    self.target.rabbit = nil
                    self.target:changeController("remote")
                    self.target.rabbit = rabbit
                else
                    self.target:changeController("remote")
                end
                self.target.vx = 0
                self.target.vy = 0
            end
        end

    elseif self.state == "pullback" then
        self.length = self.length - 800*dt
        if self.length < 0 then self.owner:changeController("default") end

    elseif self.state == "owner" then
        self.length = self.length - 500*dt
        if self.length < 20 then
            self.owner.nogravity = false
            self.owner:changeController("default")
            self:destroy()
        end

    elseif self.state == "hunter" then
        self.length = self.length - 500*dt
        self.target.px = self.x
        self.target.py = self.y
        if self.length < 0 then
            self.target.nogravity = false
            self.target.vx = -self.mx*500
            self.target.vy = -self.my*500
            self.target.controller:setTimeout(0.1)
            self.owner:changeController("default")
        end

    elseif self.state == "rabbit" then
        self.length = self.length - 500*dt
        self.target:moveHooked(self.x, self.y)
        if self.length < 0 then
            self.target:release("fixed", self.x, self.y)
            self.owner:changeController("default")
        end

    else
        print("Fatal Error: Hook state ", self.state, " not supportet!")
        not_existing_function(false)

    end
end


function Hook:draw()
    local x = self.owner.px + (self.owner.sx/2 * self.mx)
    local y = self.owner.py + (self.owner.sy/2 * self.my)
    love.graphics.setColor( 139, 69, 19 )
    love.graphics.line( x, y, self.x, self.y )
    love.graphics.setColor( 255, 255, 255 )
    if self.direction == 180 then
        love.graphics.draw(Assets.hookRight, self.x+2, self.y, math.rad(90))
    elseif self.direction < 180 then
        love.graphics.draw(Assets.hookRight, self.x-2, self.y-2, math.rad(self.direction-90))
    else
        love.graphics.draw(Assets.hookLeft, self.x, self.y, math.rad(self.direction-270), 1, 1, 8, 2)
    end

end



return Hook
