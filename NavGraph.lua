local CLASS = require('Class')
local PQueue = require("PriorityQueue")
require("Util")
navdebug = false
local NavGraph = CLASS()

-- *************************************************
-- *             Navigation Graph                  *
-- *************************************************
NavGraph.nodes = {}
-- index should be continious integer started from 1
-- each node is a 2D point
-- and neighbors when imported
-- node = {x, y, neighbors = {} }
-- neighbors entry = {goal (index), type, cost}
function NavGraph:import(map)
	local map = map .. ".lua"
	local tmp = map
	-- Get path to map
	local path = map:reverse():find("[/\\]") or ""
	if path ~= "" then
		path = map:sub(1, 1 + (#map - path))
	end
	-- Load map
	map = love.filesystem.load(map)()
	assert(map, "File not found: "..tmp)

	self.nodes = map.nodes;
	for i,node in ipairs(self.nodes) do
		node.neighbors = {}
	end

	for i,e in ipairs(map.edges) do
		edge = {}
		edge.next = e.next
		edge.type = e.type
		if e.cost == "eudist" then
			edge.cost = 
			eudist(self.nodes[e.start].x, self.nodes[e.start].y,
            self.nodes[e.next].x, self.nodes[e.next].y)
		end
		table.insert(self.nodes[e.start].neighbors, edge)
		-- other tags
	end
end

function NavGraph:defaultHeuristic(node1, node2)
	return eudist(node1.x, node1.y, node2.x, node2.y)
end
NavGraph.heuristic = NavGraph.defaultHeuristic

function NavGraph:changeHeuristic(heur)
	assert(heur)
	self.heuristic = heur
end

-- simply use standard A* to findPath, start and goal are segments
function NavGraph:findPath(start, goal)
	if navdebug then print("start: ",start,self.nodes[start].x,self.nodes[start].y) end
	if navdebug then print("goal: ",goal,self.nodes[goal].x,self.nodes[goal].y) end
	local open = PQueue.new() -- open list: priority queue
	open:enqueue(start,0)
	local close = {} -- close list: store visited node with most updated cost
	close[start] = 0
	local backtrace = {} -- store back trace path
	backtrace[start] = nil
	
	while not open:isEmpty() do
		-- print("\n-----CLOSE TABLE----")
		-- for k,v in pairs(close) do
		-- 	print(k:tostring(), v)
		-- end
		-- print("----CLOSE TABLE----")
	 	local current = open:dequeue()
	 	--print("\ncurrent: "..current:tostring())
	 	if current == goal then
	 		--print("\nsearch finished")
	 		break 
	 	end -- search finished

		for _,edge in pairs(self.nodes[current].neighbors) do
			--print("\n\tnext: "..next:tostring())
			local newcost = close[current] + edge.cost
			--print("\n\t\tnewcost: "..tostring(newcost))
			-- next already in close?
			local inclose = false
			for k,_ in pairs(close) do
				if k == edge.next then
					inclose = true
					break
				end
			end
			--print("\n\t\tinclose: "..tostring(inclose))
			if not inclose or ( inclose and newcost < close[edge.next]) then				
				close[edge.next] = newcost
				local priority = newcost + self:heuristic(self.nodes[goal], self.nodes[edge.next])
				--print("\n\t\tenqueue",next:tostring(),"\t",priority)
				open:enqueue(edge.next, priority)
				backtrace[edge.next] = current -- trace path
			end
	 	end
	end

	-- finally, reverse backtrace to get path
	local path = {}
	path[goal] = nil
	local tmp = goal
	while backtrace[tmp] do
		path[backtrace[tmp]] = tmp
		--print(tmp:tostring())
		tmp = backtrace[tmp]
	end
	--print(start:tostring())
	
	if navdebug then print("\nPath: ") end
	local tmp = start
	while tmp do
		if navdebug then print(tmp,self.nodes[tmp].x,self.nodes[tmp].y) end
		tmp = path[tmp]
	end

	for curr,next in pairs(path) do
		for _,n in ipairs(self.nodes[curr].neighbors) do
			if n.next == next then
				path[curr] = {idx = next, type = n.type}
				break
			end
		end		
	end

	return path
end

function NavGraph:nearestNode(x, y)
	if table.getn(self.nodes) == 0 then
		return nil
	end
	local min = eudist(x,y,self.nodes[1].x, self.nodes[1].y)
	local minIdx = 1
	for i,node in ipairs(self.nodes) do
		local curr = eudist(x,y,node.x, node.y)
		if curr < min then
			min = curr
			minIdx = i
		end
	end
	return minIdx, min
end

return NavGraph