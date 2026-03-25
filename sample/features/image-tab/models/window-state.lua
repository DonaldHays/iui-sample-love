--- @class ImageTabWindowState
--- @field leftSplitValue number
--- @field rightSplitValue number
local ImageTabWindowState = {}

function ImageTabWindowState.new()
    --- @type ImageTabWindowState
    return {
        leftSplitValue = 200,
        rightSplitValue = 300,
    }
end

return ImageTabWindowState
