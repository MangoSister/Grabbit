return
{
	nodes = 
	{
		-- ground
		{x = 50, y = 752},	--1
		{x = 150, y = 752},	--2
		{x = 230, y = 752},	--3
		{x = 320, y = 752},	--4
		{x = 410, y = 752},	--5 -- joint
		{x = 500, y = 752},	--6 -- joint
		{x = 600, y = 752},	--7
		{x = 670, y = 752},	--8
		{x = 740, y = 752},	--9
		{x = 800, y = 752},	--10
		{x = 840, y = 718},	--11
		{x = 930, y = 718},	--12 -- joint
		{x = 955, y = 752},	--13 -- joint
		{x = 1010, y = 752},	--14
		{x = 1060, y = 752},	--15
		{x = 1120, y = 752},	--16
		{x = 1185, y = 752},	--17
		{x = 1240, y = 752},	--18

		--left bottom tile cliff
		{x = 50, y = 592},	-- 19
		{x = 208, y = 592},	-- 20 -- ladder
		{x = 310, y = 592},	-- 21 -- joint

		-- left bottom small platform
		{x = 400, y = 560},	-- 22 -- joint
		{x = 470, y = 560},	-- 23 -- joint
		
		-- bottom square top
		{x = 555, y = 496},	-- 24 -- joint
		{x = 600, y = 496},	-- 25 -- joint
		{x = 680, y = 496},	-- 26 -- joint
		{x = 725, y = 496},	-- 27 -- joint
		

		-- right pillar middle
		{x = 830, y = 528},	-- 28
		{x = 920, y = 528},	-- 29

		-- right bottom middle platform
		{x = 990, y = 592},	-- 30
		{x = 1105, y = 592},	-- 31 -- ladder
		{x = 1180, y = 599},	-- 32

		-- left middle tile cliff
		{x = 50, y = 336},	-- 33 -- joint
		{x = 159, y = 336},	-- 34 --joint

		-- left ladder middle
		{x = 208, y = 432},	-- 35 -- joint --ladder

		-- left pillar middle
		{x = 255, y = 400},	-- 36 -- joint
		{x = 320, y = 400},	-- 37
		{x = 350, y = 304},	-- 38
		{x = 444, y = 304},	-- 39

		-- middle large platform
		{x = 534, y = 368},	-- 40 -- joint
		{x = 640, y = 368},	-- 41 -- joint
		{x = 754, y = 375},	-- 42 -- joint

		-- right pillar top
		{x = 840, y = 304},	-- 43 -- joint
		{x = 924, y = 304},	-- 44 -- joint
		{x = 1005, y = 368},	-- 45 -- joint

		-- right ladder middle
		{x = 1105, y = 464},	-- 46 -- joint

		-- right middle tile cliff
		{x = 1154, y = 432},	-- 47 -- joint
		{x = 1260, y = 432},	-- 48

		-- left top middle platform
		{x = 97, y = 144},	-- 49
		{x = 208, y = 144},	-- 50 -- ladder top
		{x = 273, y = 146},	-- 51

		-- left pillar top
		{x = 365, y = 112},	-- 52
		{x = 440, y = 112},	-- 53

		-- top square top
		{x = 550, y = 80},	-- 54
		{x = 600, y = 80},	-- 55
		{x = 680, y = 80},	-- 56
		{x = 730, y = 80},	-- 57

		-- top right small platform
		{x = 815, y = 144},	-- 58 -- joint
		{x = 890, y = 144},	-- 59 -- joint

		-- top right tile cliff
		{x = 1005, y = 112},	-- 60
		{x = 1105, y = 112},	-- 61 -- ladder
		{x = 1250, y = 112},	-- 62

	},

	edges = 
	{	
		{start = 1,next = 2,type = "run",cost = "eudist"},
		{start = 2,next = 1,type = "run",cost = "eudist"},	

		{start = 2,next = 3,type = "run",cost = "eudist"},
		{start = 3,next = 2,type = "run",cost = "eudist"},	

		{start = 3,next = 4,type = "run",cost = "eudist"},
		{start = 4,next = 3,type = "run",cost = "eudist"},

		{start = 4,next = 5,type = "run",cost = "eudist"},
		{start = 5,next = 4,type = "run",cost = "eudist"},

		{start = 5,next = 6,type = "run",cost = "eudist"},
		{start = 6,next = 5,type = "run",cost = "eudist"},

		{start = 6,next = 7,type = "run",cost = "eudist"},
		{start = 7,next = 6,type = "run",cost = "eudist"},

		{start = 7,next = 8,type = "run",cost = "eudist"},
		{start = 8,next = 7,type = "run",cost = "eudist"},

		{start = 8,next = 9,type = "run",cost = "eudist"},
		{start = 9,next = 8,type = "run",cost = "eudist"},

		{start = 9,next = 10,type = "run",cost = "eudist"},
		{start = 10,next = 9,type = "run",cost = "eudist"},

		{start = 10,next = 11,type = "jump",cost = "eudist"},
		{start = 11,next = 10,type = "jump",cost = "eudist"},

		{start = 11,next = 12,type = "run",cost = "eudist"},
		{start = 12,next = 11,type = "run",cost = "eudist"},

		{start = 12,next = 13,type = "jump",cost = "eudist"},
		{start = 13,next = 12,type = "jump",cost = "eudist"},

		{start = 13,next = 14,type = "run",cost = "eudist"},
		{start = 14,next = 13,type = "run",cost = "eudist"},

		{start = 14,next = 15,type = "run",cost = "eudist"},
		{start = 15,next = 14,type = "run",cost = "eudist"},

		{start = 15,next = 16,type = "run",cost = "eudist"},
		{start = 16,next = 15,type = "run",cost = "eudist"},

		{start = 16,next = 17,type = "run",cost = "eudist"},
		{start = 17,next = 16,type = "run",cost = "eudist"},

		{start = 17,next = 18,type = "run",cost = "eudist"},
		{start = 18,next = 17,type = "run",cost = "eudist"},

		{start = 19,next = 20,type = "run",cost = "eudist"},
		{start = 20,next = 19,type = "run",cost = "eudist"},

		{start = 20,next = 21,type = "run",cost = "eudist"},
		{start = 21,next = 20,type = "run",cost = "eudist"},

		{start = 21,next = 22,type = "jump",cost = "eudist"},
		{start = 22,next = 21,type = "jump",cost = "eudist"},

		{start = 5,next = 21,type = "jump",cost = "eudist"},
		{start = 21,next = 5,type = "jump",cost = "eudist"},

		{start = 5,next = 22,type = "jump",cost = "eudist"},
		{start = 6,next = 23,type = "jump",cost = "eudist"},

		{start = 22,next = 23,type = "run",cost = "eudist"},
		{start = 23,next = 22,type = "run",cost = "eudist"},

		{start = 23,next = 24,type = "jump",cost = "eudist"},
		{start = 24,next = 23,type = "jump",cost = "eudist"},

		{start = 24,next = 25,type = "run",cost = "eudist"},
		{start = 25,next = 24,type = "run",cost = "eudist"},

		{start = 25,next = 26,type = "jump",cost = "eudist"},
		{start = 26,next = 25,type = "jump",cost = "eudist"},

		{start = 26,next = 27,type = "run",cost = "eudist"},
		{start = 27,next = 26,type = "run",cost = "eudist"},

		{start = 27,next = 28,type = "jump",cost = "eudist"},
		{start = 28,next = 27,type = "jump",cost = "eudist"},

		{start = 28,next = 29,type = "run",cost = "eudist"},
		{start = 29,next = 28,type = "run",cost = "eudist"},

		{start = 29,next = 30,type = "jump",cost = "eudist"},
		{start = 30,next = 29,type = "jump",cost = "eudist"},

		--{start = 12,next = 30,type = "jump",cost = "eudist"},
		{start = 30,next = 13,type = "jump",cost = "eudist"},
		{start = 13,next = 30,type = "jump",cost = "eudist"},

		{start = 30,next = 31,type = "run",cost = "eudist"},
		{start = 31,next = 30,type = "run",cost = "eudist"},

		{start = 31,next = 32,type = "run",cost = "eudist"},
		{start = 32,next = 31,type = "run",cost = "eudist"},

		{start = 32,next = 18,type = "jump",cost = "eudist"},
		{start = 18,next = 32,type = "jump",cost = "eudist"},

		{start = 33,next = 34,type = "run",cost = "eudist"},
		{start = 34,next = 33,type = "run",cost = "eudist"},

		--{start = 34,next = 35,type = "jump",cost = "eudist"},
		--{start = 35,next = 34,type = "jump",cost = "eudist"},

		--{start = 35,next = 20,type = "climb",cost = "eudist"},
		--{start = 20,next = 35,type = "climb",cost = "eudist"},

		{start = 34,next = 36,type = "jump",cost = "eudist"},
		{start = 36,next = 34,type = "jump",cost = "eudist"},

		{start = 36,next = 20,type = "jump",cost = "eudist"},

		{start = 36,next = 37,type = "run",cost = "eudist"},
		{start = 37,next = 36,type = "run",cost = "eudist"},

		{start = 37,next = 38,type = "jump",cost = "eudist"},
		{start = 38,next = 37,type = "jump",cost = "eudist"},

		{start = 38,next = 39,type = "run",cost = "eudist"},
		{start = 39,next = 38,type = "run",cost = "eudist"},

		{start = 39,next = 40,type = "jump",cost = "eudist"},
		{start = 40,next = 39,type = "jump",cost = "eudist"},

		{start = 40,next = 41,type = "run",cost = "eudist"},
		{start = 41,next = 40,type = "run",cost = "eudist"},

		{start = 41,next = 42,type = "run",cost = "eudist"},
		{start = 42,next = 41,type = "run",cost = "eudist"},

		{start = 24,next = 40,type = "jump",cost = "eudist"},
		{start = 25,next = 41,type = "jump",cost = "eudist"},
		{start = 26,next = 41,type = "jump",cost = "eudist"},
		{start = 27,next = 42,type = "jump",cost = "eudist"},

		{start = 42,next = 43,type = "jump",cost = "eudist"},
		{start = 43,next = 42,type = "jump",cost = "eudist"},

		{start = 43,next = 44,type = "run",cost = "eudist"},
		{start = 44,next = 43,type = "run",cost = "eudist"},

		{start = 44,next = 45,type = "jump",cost = "eudist"},
		{start = 45,next = 44,type = "jump",cost = "eudist"},

		--{start = 45,next = 46,type = "jump",cost = "eudist"},
		--{start = 46,next = 45,type = "jump",cost = "eudist"},

		{start = 45,next = 47,type = "jump",cost = "eudist"},
		{start = 47,next = 45,type = "jump",cost = "eudist"},

		{start = 47,next = 31,type = "jump",cost = "eudist"},
		--{start = 46,next = 47,type = "jump",cost = "eudist"},
		--{start = 47,next = 46,type = "jump",cost = "eudist"},

		--{start = 46,next = 31,type = "climb",cost = "eudist"},
		--{start = 31,next = 46,type = "climb",cost = "eudist"},

		{start = 47,next = 48,type = "run",cost = "eudist"},
		{start = 48,next = 47,type = "run",cost = "eudist"},

		{start = 33,next = 49,type = "jump",cost = "eudist"},
		{start = 49,next = 33,type = "jump",cost = "eudist"},

		{start = 49,next = 50,type = "run",cost = "eudist"},
		{start = 50,next = 49,type = "run",cost = "eudist"},

		{start = 50,next = 51,type = "run",cost = "eudist"},
		{start = 51,next = 50,type = "run",cost = "eudist"},

		{start = 51,next = 52,type = "jump",cost = "eudist"},
		{start = 52,next = 51,type = "jump",cost = "eudist"},

		{start = 52,next = 53,type = "run",cost = "eudist"},
		{start = 53,next = 52,type = "run",cost = "eudist"},

		{start = 53,next = 54,type = "jump",cost = "eudist"},
		{start = 54,next = 53,type = "jump",cost = "eudist"},

		{start = 54,next = 55,type = "run",cost = "eudist"},
		{start = 55,next = 54,type = "run",cost = "eudist"},

		{start = 55,next = 56,type = "jump",cost = "eudist"},
		{start = 56,next = 55,type = "jump",cost = "eudist"},

		{start = 56,next = 57,type = "run",cost = "eudist"},
		{start = 57,next = 56,type = "run",cost = "eudist"},

		{start = 57,next = 58,type = "jump",cost = "eudist"},
		{start = 58,next = 57,type = "jump",cost = "eudist"},

		{start = 58,next = 59,type = "run",cost = "eudist"},
		{start = 59,next = 58,type = "run",cost = "eudist"},

		{start = 43,next = 58,type = "jump",cost = "eudist"},
		{start = 44,next = 59,type = "jump",cost = "eudist"},

		{start = 59,next = 60,type = "jump",cost = "eudist"},
		{start = 60,next = 59,type = "jump",cost = "eudist"},

		{start = 60,next = 44,type = "jump",cost = "eudist"},

		{start = 60,next = 61,type = "run",cost = "eudist"},
		{start = 61,next = 60,type = "run",cost = "eudist"},

		{start = 61,next = 62,type = "run",cost = "eudist"},
		{start = 62,next = 61,type = "run",cost = "eudist"},

	}
}