-- *************************************************
-- *           The FSM AI Controller               *
-- *************************************************

require ("Class")
fsmdebug = false
local FsmCtl = CLASS()
FsmCtl.class = "FsmCtl"
FsmCtl.entity = nil
FsmCtl.currState = nil
FsmCtl.prevState = nil
FsmCtl.globalState = nil -- a globalState that always executes

function FsmCtl:attach( ent )
    self.entity = ent
end

function FsmCtl:detach()
    self.entity = nil
end

function FsmCtl:update(dt)
	if self.globalState then
		self.globalState:execute(dt)
	end
	if self.currState then
		self.currState:execute(dt)
	end
end

function FsmCtl:setState(state)
	assert(state)
	state.parentMachine = self
	self.currState = state
end

function FsmCtl:changeState(newState)
	assert(newState)
	newState.parentMachine = self
	newState.agent = self.entity
	self.prevState = self.currState -- save the prev state
	if self.currState then
		self.currState:exit() -- exit current state
	end
	self.currState = newState -- state transform

	debuglog = debuglog.."\nChange State".." curr: "..self.currState.name.." prev: "
	
	if self.prevState then
		debuglog = debuglog..self.prevState.name
		if fsmdebug then print("\nChange State".." curr: "..self.currState.name.." prev: "..self.prevState.name) end
	else 
		debuglog = debuglog.."nil"	
		if fsmdebug then print("\nChange State".." curr: "..self.currState.name.." prev: ".."nil") end
	end
	self.currState:enter() -- enter new state	
end

function FsmCtl:exitState()
	assert(self.currState)
	self.prevState = self.currState
	self.currState:exit()
	if fsmdebug then print("\nExit State: "..self.currState.name) end
end

function FsmCtl:restoreState()
	self:changeState(self.prevState)
end

function FsmCtl:isInState(sname)
 	return sname == self.currState.name
end

return FsmCtl
