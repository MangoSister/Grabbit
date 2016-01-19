
function eudist(x1, y1, x2, y2)
	return math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
end

function eudistsqr(x1,y1,x2,y2)
	return (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)
end

function normalize(x,y)
	local r = math.sqrt(x*x + y*y)
	return x/r, y/r
end

function angle(x1,y1,x2,y2)
	if x1 == x2 then
		if y2>=y1 then
			return math.rad(90)
			else return math.rad(-90)
		end
	elseif y1 == y2 then
		if(x2>=x1) then
			return math.rad(0)
		else return math.rad(180)
		end
	else return math.atan2(y2 - y1, x2 - x1)
	end
end
function clamp(x, a, b)
	assert(a <= b)
	if(x > b) then
		x = b
	elseif(x < a) then
		x = a
	end
	return x
end

-- Checks if two line segments intersect. Line segments are given in form of ({x,y},{x,y}, {x,y},{x,y}).
function checkIntersect(l1p1, l1p2, l2p1, l2p2)
    local function checkDir(pt1, pt2, pt3) return math.sign(((pt2.x-pt1.x)*(pt3.y-pt1.y)) - ((pt3.x-pt1.x)*(pt2.y-pt1.y))) end
    return (checkDir(l1p1,l1p2,l2p1) ~= checkDir(l1p1,l1p2,l2p2)) and (checkDir(l2p1,l2p2,l1p1) ~= checkDir(l2p1,l2p2,l1p2))
end

-- Checks if two lines intersect (or line segments if seg is true)
-- Lines are given as four numbers (two coordinates)
-- weird behavior
-- findIntersect(472.9048,594.7876,472.9048,619.7875,
--               464,617.333,537.333,617.333)            
-- findIntersect(472, 594, 472, 619,
--               464, 617, 537, 617)
function findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, seg1, seg2)
	seg1 = seg1 or true
	seg2 = seg2 or true
    local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
    local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
    local det,x,y = a1*b2 - a2*b1
    if det==0 then return false, "The lines are parallel." end
    x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
    if seg1 or seg2 then
        local min,max = math.min, math.max
        if seg1 and not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
           seg2 and not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
            return false, "The lines don't intersect."
        end
    end
    return x,y
end

-- calculate distance between a pt and a line/segment
function pt2segdist(pt,l,seg)
	local seg = seg or true
	local u = (pt.x - l.pt1.x) * (l.pt2.x - l.pt1.x) + (pt.y - l.pt1.y) * (l.pt2.y - l.pt1.y)
	u = u/eudistsqr(l.pt1.x, l.pt1.y, l.pt2.x, l.pt2.y)
	if seg == true then
		u = clamp(u,0,1)
	end
	local closept = {}
	closept.x = (1-u) * l.pt1.x + u * l.pt2.x
	closept.y = (1-u) * l.pt1.y + u * l.pt2.y
	return eudist(pt.x, 
					pt.y,
					closept.x,
					closept.y), closept
end

-- calculate distance between two segments
function segdist(l1,l2)
	local istx, isty = findIntersect(l1.pt1.x, l1.pt1.y, 
								l1.pt2.x, l1.pt2.y, 
								l2.pt1.x, l2.pt1.y, 
								l2.pt2.x, l2.pt2.y,true,true)
	-- there is an intersection
	if istx then
		return 0, {istx, isty}
	end
	-- no intersection -> the smallest dist between two segment
	local result = {}
	local d11, cpt11 = pt2segdist(l1.pt1, l2, true)
	local l1pt1 = {}
	l1pt1.x = l1.pt1.x
	l1pt1.y = l1.pt1.y
	result[d11] = {l1pt1, cpt11}
	local d12, cpt12 = pt2segdist(l1.pt2, l2, true)
	local l1pt2 = {}
	l1pt2.x = l1.pt2.x
	l1pt2.y = l1.pt2.y
	result[d12] = {l1pt2, cpt12}
	local d21, cpt21 = pt2segdist(l2.pt1, l1, true)
	local l2pt1 = {}
	l2pt1.x = l2.pt1.x
	l2pt1.y = l2.pt1.y
	result[d21] = {cpt21, l2pt1}
	local d22, cpt22 = pt2segdist(l2.pt2, l1, true)
	local l2pt2 = {}
	l2pt2.x = l2.pt2.x
	l2pt2.y = l2.pt2.y
	result[d22] = {cpt22, l2pt2}
	local dmin = math.min(d11, d12, d21, d22)
	return dmin, result[dmin]
end


function getImpulseForce(mass,startVelo, endVelo)
 -- t = 1 impulse
 local f = mass * (endVelo - startVelo)
 return f
end

function solveQuadEq(a,b,c)
	local delta = b * b - 4 * a * c
	if delta < 0 then
		return nil
	elseif delta == 0 then
		return - 0.5 * b / a
	else return - 0.5 * (b + math.sqrt(delta) )  / a,
				 - 0.5 * (b - math.sqrt(delta) ) / a
	end
end
