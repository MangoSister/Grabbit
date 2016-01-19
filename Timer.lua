local timers = {}
local atimer = {}
local timer_mt = { __index = atimer }
local function setTimer(func,time,rep,...)
	if type(func) ~= "function" then
		return false
	end
	if not tonumber(time) then
		return false
	end
	if tonumber(rep) then
		rep = math.floor(rep)
	else
		return false
	end
	if rep == 0 then 
		rep = "inf" 
	end
	local tab = {}
	if arg then
		tab = {func=func,curtime=0,time=time,rep=rep,arg=arg}
	else
		tab = {func=func,curtime=0,time=time,rep=rep}
	end
	setmetatable(tab, timer_mt)
	timers[tab] = tab
	return tab
end

local function timerUpdate(dt)
	for i,timer in pairs(timers) do
		timer.curtime = timer.curtime + dt
		if timer.curtime >= timer.time then
			if timer.arg then
				timer.func(unpack(timer.arg))
			else
				timer.func()
			end
			if timer.rep == "inf" then
				timer.curtime = 0
			elseif timer.rep > 1 then
				timer.rep = timer.rep-1
				timer.curtime = 0
			else
				timer:kill()
			end
		end
	end
end
function atimer:isRunning()
	if type(self) == "table" and timers[self] then
		return true
	else
		return false
	end
end
function atimer:kill()
	if self:isRunning() then
		timers[self] = nil
		self = nil
		return true
	else
		return false
	end
end
function atimer:reset()
	if self:isRunning() then
		self.curtime = 0
		return true
	else
		return false
	end
end
function atimer:getDetails()
	if self:isRunning() then
		if self.rep == "inf" then
			return self.time - self.curtime, 0
		else
			return self.time - self.curtime, self.rep
		end
	else
		return false
	end
end
local function getTimers(s)
	local tab = {}
	for i,timer in pairs(timers) do
		if (tonumber(s) and (timer.time - timer.curtime) <= s) or not tonumber(s) then
			tab[#tab+1] = timer	
		end
	end
	return tab
end
return {setTimer=setTimer,timerUpdate=timerUpdate,getTimers=getTimers}