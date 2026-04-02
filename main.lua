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
        smileMSDFLayeredImage = {
            {
                image = love.graphics.newImage(
                    "sample/assets/smile-bg.png",
                    { linear = true, mipmaps = false }
                ),
                color = iui.newColor(0.944, 0.794, 0.468)
            },
            {
                image = love.graphics.newImage(
                    "sample/assets/smile-fg.png",
                    { linear = true, mipmaps = false }
                ),
                color = iui.newColor(0.157, 0.157, 0.157)
            }
        },
        nineSliceMSDFLayeredImage = {
            {
                image = {
                    image = love.graphics.newImage(
                        "sample/assets/nine-slice-interior.png",
                        { linear = true, mipmaps = false }
                    ),
                    l = 16,
                    t = 24,
                    r = 16,
                    b = 24
                },
                color = iui.newColor(0.337, 0.653, 0.939)
            },
            {
                image = {
                    image = love.graphics.newImage(
                        "sample/assets/nine-slice-frame.png",
                        { linear = true, mipmaps = false }
                    ),
                    l = 16,
                    t = 24,
                    r = 16,
                    b = 24
                },
                color = iui.newColor(0.258, 0.300, 0.572)
            }
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
