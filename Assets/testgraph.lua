return
{
	nodes = 
	{
		-- gound
		{x = 50, y = 750},	--1
		{x = 300, y = 750},	--2

		--platform 1 
		{x = 330, y = 656},	--3
		{x = 420, y = 656},	--4

		--platform 2 
		{x = 464, y = 592},	--5
		{x = 537, y = 592},	--6

		--platform 3 
		{x = 588, y = 498},	--7
		{x = 665, y = 498},	--8

		--platform 4 
		{x = 670, y = 429},	--9
		{x = 742, y = 429},	--10

		--platform 5
		{x = 770, y = 374},	--11
		{x = 978, y = 372},	--12
		{x = 1181, y = 370},	--13

		--platform 6
		{x = 746, y = 305},	--14
		{x = 682, y = 305},	--15

		--platform 7
		{x = 670, y = 240},	--16
		{x = 593, y = 240},	--17

		--platform 8
		{x = 541, y = 178},	--18
		{x = 285, y = 177},	--19
		{x = 136, y = 187},	--20
				
	},

	edges = 
	{	
		{start = 1,next = 2,type = "run",cost = "eudist"},
		{start = 2,next = 1,type = "run",cost = "eudist"},

		{start = 2,next = 3,type = "jump",cost = "eudist"},
		{start = 3,next = 2,type = "jump",cost = "eudist"},

		{start = 3,next = 4,type = "run",cost = "eudist"},
		{start = 4,next = 3,type = "run",cost = "eudist"},	

		{start = 4,next = 5,type = "jump",cost = "eudist"},
		{start = 5,next = 4,type = "jump",cost = "eudist"},	

		{start = 5,next = 6,type = "run",cost = "eudist"},
		{start = 6,next = 5,type = "run",cost = "eudist"},	

		{start = 6,next = 7,type = "jump",cost = "eudist"},
		{start = 7,next = 6,type = "jump",cost = "eudist"},	

		{start = 7,next = 8,type = "run",cost = "eudist"},
		{start = 8,next = 7,type = "run",cost = "eudist"},

		{start = 8,next = 9,type = "jump",cost = "eudist"},
		{start = 9,next = 8,type = "jump",cost = "eudist"},	

		{start = 9,next = 10,type = "run",cost = "eudist"},
		{start = 10,next = 9,type = "run",cost = "eudist"},	

		{start = 10,next = 11,type = "jump",cost = "eudist"},
		{start = 11,next = 10,type = "jump",cost = "eudist"},	

		{start = 11,next = 12,type = "run",cost = "eudist"},
		{start = 12,next = 11,type = "run",cost = "eudist"},

		{start = 10,next = 11,type = "jump",cost = "eudist"},
		{start = 11,next = 10,type = "jump",cost = "eudist"},	

		{start = 11,next = 12,type = "run",cost = "eudist"},
		{start = 12,next = 11,type = "run",cost = "eudist"},

		{start = 12,next = 13,type = "run",cost = "eudist"},
		{start = 13,next = 12,type = "run",cost = "eudist"},

		{start = 11,next = 14,type = "jump",cost = "eudist"},
		{start = 14,next = 12,type = "jump",cost = "eudist"},	

		{start = 14,next = 15,type = "run",cost = "eudist"},
		{start = 15,next = 14,type = "run",cost = "eudist"},	

		{start = 9,next = 15,type = "jump",cost = "eudist"},
		{start = 10,next = 14,type = "jump",cost = "eudist"},	

		{start = 15,next = 16,type = "jump",cost = "eudist"},
		{start = 16,next = 14,type = "jump",cost = "eudist"},	

		{start = 16,next = 17,type = "run",cost = "eudist"},
		{start = 17,next = 16,type = "run",cost = "eudist"},

		{start = 17,next = 18,type = "jump",cost = "eudist"},
		{start = 18,next = 17,type = "jump",cost = "eudist"},	

		{start = 18,next = 19,type = "run",cost = "eudist"},
		{start = 19,next = 18,type = "run",cost = "eudist"},	

		{start = 19,next = 20,type = "run",cost = "eudist"},
		{start = 20,next = 19,type = "run",cost = "eudist"},

		{start = 20,next = 1,type = "jump",cost = "eudist"},					
	}
}