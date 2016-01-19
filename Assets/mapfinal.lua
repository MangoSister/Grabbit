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
      name = "plattform_large",
      firstgid = 2,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "plattform_large_finished.png",
      imagewidth = 256,
      imageheight = 32,
      transparentcolor = "#ff00ff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "plattform_medium",
      firstgid = 10,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "plattform_medium_finished.png",
      imagewidth = 192,
      imageheight = 32,
      transparentcolor = "#ff00ff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "plattform_small",
      firstgid = 16,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "plattform_small_finished.png",
      imagewidth = 96,
      imageheight = 32,
      transparentcolor = "#ff00ff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "ladder_finished",
      firstgid = 19,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "ladder_finished.png",
      imagewidth = 32,
      imageheight = 128,
      transparentcolor = "#ff00ff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "spring",
      firstgid = 23,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "spring.png",
      imagewidth = 32,
      imageheight = 32,
      transparentcolor = "#ff00ff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "rabbithole_finished",
      firstgid = 24,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "rabbithole_finished.png",
      imagewidth = 128,
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
      image = "bg2.png",
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
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 10, 11, 12, 13, 14, 15, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 16, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 17, 18, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 10, 11, 12, 13, 14, 15, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      name = "interact",
      x = 0,
      y = 0,
      width = 41,
      height = 25,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 23, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 25, 26, 27, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 22, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 23, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 24, 25, 26, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 22, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 25, 26, 27, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "collision",
      visible = false,
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
          x = 353.184,
          y = 321.414,
          width = 95.4221,
          height = 190.522,
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
          x = 256.772,
          y = 416.915,
          width = 96.086,
          height = 31.4858,
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
          x = 352.433,
          y = 128.4,
          width = 95.4466,
          height = 127.209,
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
          x = 32.2178,
          y = 351.897,
          width = 128.304,
          height = 31.7348,
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
          x = 32.3489,
          y = 608.366,
          width = 287.824,
          height = 30.8778,
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
          x = 832.995,
          y = 320.569,
          width = 95.0933,
          height = 159.053,
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
          x = 928.113,
          y = 384.53,
          width = 95.948,
          height = 30.6296,
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
          x = 832.283,
          y = 543.797,
          width = 95.952,
          height = 128.501,
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
          x = 993.054,
          y = 127.666,
          width = 285.919,
          height = 32.1315,
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
          x = 1152.21,
          y = 448.417,
          width = 128.193,
          height = 30.8623,
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
          x = 832.76,
          y = 736.36,
          width = 94.7791,
          height = 31.9981,
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
          x = 544.355,
          y = 95.973,
          width = 31.1241,
          height = 191.71,
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
          x = 672.595,
          y = 256.14,
          width = 30.9009,
          height = 31.7961,
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
          x = 703.68,
          y = 95.8287,
          width = 32.3279,
          height = 192.098,
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
          x = 575.703,
          y = 96.0577,
          width = 31.9009,
          height = 31.4628,
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
          x = 672.468,
          y = 95.7204,
          width = 30.2343,
          height = 32.4628,
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
          x = 575.993,
          y = 256.179,
          width = 32.2343,
          height = 31.4628,
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
          x = 994.366,
          y = 609.497,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 122.924, y = -0.731689 },
            { x = 188.044, y = 5.85352 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 98.2814,
          y = 160.044,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 122.924, y = -0.731689 },
            { x = 188.044, y = 5.85352 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 514.717,
          y = 385.425,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 180.714, y = 0 },
            { x = 252.706, y = 6.36662 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 394.928,
          y = 576.538,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 80.0017, y = -0.133316 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 810.274,
          y = 161.32,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 1.17864, y = 0 },
            { x = 81.8681, y = 0 }
          },
          properties = {
            ["class"] = "one"
          }
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 576.66,
          y = 672.846,
          width = 32.2343,
          height = 31.4628,
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
          x = 673.262,
          y = 672.807,
          width = 30.9009,
          height = 31.7961,
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
          x = 576.37,
          y = 512.724,
          width = 31.9009,
          height = 31.4628,
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
          x = 704.347,
          y = 512.495,
          width = 32.3279,
          height = 192.098,
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
          x = 673.135,
          y = 512.387,
          width = 30.2343,
          height = 32.4628,
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
          x = 545.021,
          y = 512.64,
          width = 31.1241,
          height = 191.71,
          rotation = 0,
          visible = true,
          properties = {
            ["class"] = "two"
          }
        }
      }
    },
    {
      type = "objectgroup",
      name = "interactPhys",
      visible = false,
      opacity = 1,
      properties = {
        ["collidable"] = "true"
      },
      objects = {
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 211.03,
          y = 160.166,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = -1.50361, y = -23.0257 },
            { x = -4.55443, y = 444.816 }
          },
          properties = {
            ["class"] = "Ladder"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1105.47,
          y = 128.295,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = -0.320082, y = -28.1345 },
            { x = 1.51814, y = 469.106 }
          },
          properties = {
            ["class"] = "Ladder"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 655.665,
          y = 772.064,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0.554047, y = -9.62211 },
            { x = 0, y = -271.026 }
          },
          properties = {
            ["class"] = "Ladder"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 720.732,
          y = 513.096,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = -0.340136, y = -6.12245 },
            { x = 0.239418, y = -145.417 }
          },
          properties = {
            ["class"] = "Ladder"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 561.06,
          y = 512.464,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = -0.340136, y = -6.46259 },
            { x = -0.0871397, y = -147.071 }
          },
          properties = {
            ["class"] = "Ladder"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 783.443,
          y = 769.704,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = -31.9685 }
          },
          properties = {
            ["class"] = "Spring"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 494.963,
          y = 766.501,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = -31.9685 }
          },
          properties = {
            ["class"] = "Spring"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1200.67,
          y = 444.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = -30.6667 }
          },
          properties = {
            ["class"] = "Spring"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 976.667,
          y = 380.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = -30.6667 }
          },
          properties = {
            ["class"] = "Spring"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 304,
          y = 412.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = -30.6667 }
          },
          properties = {
            ["class"] = "Spring"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 110.667,
          y = 348,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = -30.6667 }
          },
          properties = {
            ["class"] = "Spring"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 593.443,
          y = 253.037,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = -31.9685 }
          },
          properties = {
            ["class"] = "Spring"
          }
        }
      }
    },
    {
      type = "objectgroup",
      name = "annotation",
      visible = false,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 50.6831,
          y = 758.043,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "1"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 146.54,
          y = 758.043,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "2"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 234.685,
          y = 759.145,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "3"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 318.422,
          y = 753.636,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "4"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 408.77,
          y = 759.145,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "5"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 494.711,
          y = 756.941,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "6"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 591.67,
          y = 755.84,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "7"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 668.797,
          y = 755.84,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "8"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 736.007,
          y = 759.145,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "9"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 798.81,
          y = 755.84,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "10"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 841.781,
          y = 728.294,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "11"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 923.314,
          y = 728.294,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "12"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 956.312,
          y = 757.815,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "13"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1008.26,
          y = 760.597,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "14"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1062.98,
          y = 755.96,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "15"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1118.63,
          y = 755.96,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "16"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1185.42,
          y = 755.96,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "17"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1242,
          y = 756.887,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "18"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1180.08,
          y = 603.202,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "32"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1106.58,
          y = 591.782,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "31"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 990.69,
          y = 594.854,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "30"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 919.21,
          y = 532.418,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "29"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 830.367,
          y = 531.491,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "28"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 721.64,
          y = 497.171,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "27"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 555.607,
          y = 496.243,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "24"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 601.985,
          y = 495.316,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "25"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 680.827,
          y = 497.171,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "26"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 469.344,
          y = 565.81,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "23"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 399.777,
          y = 565.81,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "22"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 311.697,
          y = 597.695,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "21"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 208.903,
          y = 591.064,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "20"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 52.2258,
          y = 592.722,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "19"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 208.967,
          y = 156.218,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "50"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1102.66,
          y = 116.657,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "61"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 207.953,
          y = 432.136,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "35"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 255.832,
          y = 401.704,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "36"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 321.566,
          y = 397.647,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "37"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 355.171,
          y = 305.336,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "38"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 159.199,
          y = 336.033,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "34"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 60.3136,
          y = 336.033,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "33"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 97.181,
          y = 149.922,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "49"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 271.103,
          y = 160.092,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "51"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 365.328,
          y = 110.288,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "52"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 442.258,
          y = 110.288,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "53"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 641.048,
          y = 368.775,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "41"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 534.206,
          y = 370.498,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "40"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 754.782,
          y = 375.668,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "42"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 839.221,
          y = 306.738,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "43"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 923.874,
          y = 305.015,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "44"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1006.38,
          y = 372.221,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "45"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1154.08,
          y = 430.812,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "47"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1261.42,
          y = 430.812,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "48"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1106.32,
          y = 463.553,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "46"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 816.819,
          y = 153.369,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "58"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 887.472,
          y = 153.369,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "59"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 728.933,
          y = 80.9926,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "57"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 680.682,
          y = 79.2693,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "56"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 603.136,
          y = 80.9926,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "55"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 547.992,
          y = 80.9926,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "54"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1263.14,
          y = 115.458,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "62"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 1006.38,
          y = 115.458,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "60"
          }
        },
        {
          name = "",
          type = "",
          shape = "ellipse",
          x = 444.598,
          y = 306.738,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["num"] = "39"
          }
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 49.9742,
          y = 761.675,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 93.0553, y = -3.44649 },
            { x = 186.111, y = -1.72325 },
            { x = 270.55, y = -6.89299 },
            { x = 360.159, y = -1.72325 },
            { x = 454.937, y = -3.44649 },
            { x = 541.099, y = -3.44649 },
            { x = 620.369, y = -3.44649 },
            { x = 684.129, y = -3.44649 },
            { x = 742.719, y = -1.72325 },
            { x = 796.14, y = -36.1882 },
            { x = 878.856, y = -34.4649 },
            { x = 911.597, y = 0 },
            { x = 956.402, y = -1.72325 },
            { x = 1004.65, y = -3.44649 },
            { x = 1071.86, y = -3.44649 },
            { x = 1132.17, y = -1.72325 },
            { x = 1183.87, y = -1.72325 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 410.133,
          y = 759.952,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -93.0553, y = -163.708 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 963.295,
          y = 756.505,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 39.6347, y = -163.708 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 927.107,
          y = 730.657,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 72.3764, y = -139.583 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 56.8671,
          y = 591.074,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 156.815, y = 1.72325 },
            { x = 251.594, y = 3.44649 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 317.077,
          y = 601.413,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 84.4391, y = -37.9114 },
            { x = 167.155, y = -34.4649 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 473.893,
          y = 572.118,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 77.5461, y = -75.8229 },
            { x = 130.967, y = -79.2693 },
            { x = 206.79, y = -75.8229 },
            { x = 255.04, y = -77.5461 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1242.46,
          y = 758.229,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -77.5461, y = -160.262 },
            { x = -137.86, y = -163.708 },
            { x = -237.808, y = -167.155 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1002.93,
          y = 596.243,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -82.7158, y = -65.4834 },
            { x = -163.708, y = -60.3136 },
            { x = -277.443, y = -99.9483 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 725.487,
          y = 498.018,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 27.5719, y = -120.627 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 684.129,
          y = 498.018,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -43.0812, y = -129.243 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 604.86,
          y = 491.125,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 34.4649, y = -122.351 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 556.609,
          y = 492.849,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -20.679, y = -125.797 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 539.376,
          y = 372.221,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 106.841, y = -1.72325 },
            { x = 217.129, y = 1.72325 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 754.782,
          y = 379.114,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 84.4391, y = -70.6531 },
            { x = 156.815, y = -72.3764 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 542.823,
          y = 372.221,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -101.672, y = -62.0369 },
            { x = -182.664, y = -70.6531 },
            { x = -220.576, y = 27.5719 },
            { x = -273.996, y = 27.5719 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 913.321,
          y = 308.461,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 91.3321, y = 58.5904 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 110.288,
          y = 149.922,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = -14.1509, y = 1.57233 },
            { x = 101.672, y = 5.16974 },
            { x = 156.815, y = 5.16974 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1006.38,
          y = 113.734,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 101.672, y = 3.44649 },
            { x = 253.317, y = 5.16974 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 112.011,
          y = 155.092,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = -14.1509, y = -6.28931 },
            { x = -55.1439, y = 180.941 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1011.55,
          y = 113.734,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -129.243, y = 37.9114 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 889.195,
          y = 155.092,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -68.9299, y = -3.44649 },
            { x = -158.539, y = -75.8229 },
            { x = -211.959, y = -79.2693 },
            { x = -282.612, y = -74.0996 },
            { x = -337.756, y = -79.2693 },
            { x = -454.937, y = -44.8044 },
            { x = -525.59, y = -44.8044 },
            { x = -627.262, y = 1.72325 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 909.874,
          y = 306.738,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 15.7233, y = 0 },
            { x = -25.8487, y = -156.815 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 840.944,
          y = 306.738,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -27.5719, y = -153.369 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 410.133,
          y = 761.675,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -8.61623, y = -194.727 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 499.742,
          y = 761.675,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -24.1255, y = -193.004 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 60.0759,
          y = 340.43,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 87.4789, y = -4.21585 },
            { x = 206.577, y = 57.968 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1008.64,
          y = 374.157,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 162.31, y = 56.914 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1169.9,
          y = 432.125,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 92.7487, y = 0 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 911.765,
          y = 308.824,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 17.2956, y = 0 },
            { x = 95.5882, y = -197.059 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 270.588,
          y = 404.412,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = -14.1509, y = 0 },
            { x = -61.7647, y = 185.294 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polyline",
          x = 1169.12,
          y = 432.353,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = -18.8679, y = 0 },
            { x = -61.7647, y = 155.882 }
          },
          properties = {}
        }
      }
    }
  }
}
