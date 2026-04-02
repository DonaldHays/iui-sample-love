if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require "lldebugger".start()
end

local iui = require "lib.iui"
local backend = require "lib.love-iui"

local sample = require "sample"

function love.load()
    iui.load(backend)

    sample.load({
        gameSunsetImage = love.graphics.newImage(
            "sample/assets/game-sunset.png"
        ),
        nineSliceImage = {
            image = love.graphics.newImage(
                "sample/assets/ui-box-slice.png"
            ),
            l = 8,
            t = 8,
            r = 8,
            b = 8
        },
        checkmarkMSDFImage = love.graphics.newImage(
            "lib/iui/assets/glyph-checkmark.png",
            { linear = true, mipmaps = false }
        ),
        nineSliceMSDFImage = {
            image = love.graphics.newImage(
                "sample/assets/nine-slice-frame.png",
                { linear = true, mipmaps = false }
            ),
            l = 16,
            t = 24,
            r = 16,
            b = 24
        }
    })
end

function love.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    iui.beginFrame(dt)
    iui.beginWindow(love.graphics.getDimensions())

    sample.main()

    iui.endWindow()
    iui.endFrame()
end

function love.draw()
    iui.draw()
end

function love.mousemoved(x, y, dx, dy)
    backend.mousemoved(x, y, dx, dy)
end

function love.mousepressed(x, y, button)
    backend.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    backend.mousereleased(x, y, button)
end

function love.wheelmoved(x, y)
    backend.wheelmoved(x, y)
end

function love.keypressed(key, scancode, isRepeat)
    backend.keypressed(key, scancode, isRepeat)
end

function love.keyreleased(key, scancode)
    backend.keyreleased(key, scancode)
end

function love.textinput(text)
    backend.textinput(text)
end
