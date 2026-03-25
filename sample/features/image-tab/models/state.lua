--- @class ImageTabState
--- @field imageFilter IUIImageFilter
--- @field imageFillMode IUIImageMode
--- @field imageClip boolean
local ImageTabState = {}

function ImageTabState.new()
    --- @type ImageTabState
    return {
        imageFilter = "linear",
        imageFillMode = "aspectFit",
        imageClip = true,
    }
end

return ImageTabState
