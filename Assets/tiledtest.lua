return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 41,
  height = 25,
  tilewidth = 32,
  tileheight = 32,
  properties = {},
  tilesets = {
    {
      name = "box1-32px",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "box1-32px.png",
      imagewidth = 32,
      imageheight = 32,
      transparentcolor = "#ff00ff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {
        {
          id = 0,
          properties = {
            ["class"] = "Tile"
          }
        }
      }
    },
    {
      name = "rabbit1",
      firstgid = 2,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "rabbit1.gif",
      imagewidth = 32,
      imageheight = 32,
      transparentcolor = "#ff00ff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "imagelayer",
      name = "background",
      x = 0,
      y = 0,
      visible = true,
      opacity = 1,
      image = "bg1.png",
      properties = {}
    },
    {
      type = "imagelayer",
      name = "frame",
      x = 0,
      y = 0,
      visible = true,
      opacity = 1,
      image = "frame1.png",
      properties = {}
    },
    {
      type = "tilelayer",
      name = "tiles",
      x = 0,
      y = 0,
      width = 41,
      height = 25,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "objectgroup",
      name = "seggraph",
      visible = false,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 228,
          y = 194.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = -4.5, y = -2.5 },
            { x = 284, y = -1.33333 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 32,
          y = 768,
          width = 200,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 1248, y = 0.666667 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 768.5,
          y = 384.833,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 254.5, y = -0.83333 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 324,
          y = 678.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 94.6667, y = -1.33333 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 464,
          y = 617.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 73.3333, y = 0 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 573.333,
          y = 516,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 77.3333, y = 1.33333 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 674.667,
          y = 438.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 68, y = 0 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 682.667,
          y = 321.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 64, y = 0 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 593.333,
          y = 256,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 65.3333, y = 0 }
          },
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "tilecollision",
      visible = true,
      opacity = 1,
      properties = {
        ["collidable"] = "true"
      },
      objects = {
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 32,
          y = 768,
          width = 200,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 1248, y = 0.666667 }
          },
          properties = {
            ["class"] = "two"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1280,
          y = 32,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = 736.833 }
          },
          properties = {
            ["class"] = "two"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 32,
          y = 32,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = 736.833 }
          },
          properties = {
            ["class"] = "two"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 32,
          y = 32,
          width = 200,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 1248, y = 0.666667 }
          },
          properties = {
            ["class"] = "two"
          }
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 768,
          y = 384,
          width = 256,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {
            ["class"] = "two"
          }
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 192,
          width = 288,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["class"] = "two"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 593.333,
          y = 256,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 65.3333, y = 0 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 674.667,
          y = 438.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 68, y = 0 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 324,
          y = 678.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 94.6667, y = -1.33333 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 682.667,
          y = 321.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 64, y = 0 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 464,
          y = 617.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 73.3333, y = 0 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 768.5,
          y = 384.833,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 254.5, y = -0.83333 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 573.333,
          y = 516,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 77.3333, y = 1.33333 }
          },
          properties = {
            ["class"] = "one"
          }
        }
      }
    }
  }
}
