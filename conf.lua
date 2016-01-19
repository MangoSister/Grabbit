

function love.conf(t)
    t.window.title = "gRabbit 0.0.1 alpha"
    t.window.width = 1300
    t.window.height = 800
    t.window.borderless = false
    t.window.resizable = false
    t.window.vsync = true
    t.modules.system = true
    t.modules.event = true
    t.modules.window = true
    t.modules.image = true
    t.modules.graphics = true
    t.modules.math = true
    t.modules.physics = true
    t.modules.audio = true
    t.modules.keyboard = true

    io.stdout:setvbuf("no")            -- Allows Sublime Text to print in real time
end
