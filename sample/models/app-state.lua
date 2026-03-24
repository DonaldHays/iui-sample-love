local MainTabState = require "sample.features.main-tab.models.state"

--- @class SampleAppState
--- @field mainTab MainTabState
--- @field imageFilter IUIImageFilter
--- @field imageFillMode IUIImageMode
--- @field imageClip boolean
local SampleAppState = {}

--- @return SampleAppState
function SampleAppState.new()
    --- @type SampleAppState
    return {
        mainTab = MainTabState.new(),
        imageFilter = "linear",
        imageFillMode = "aspectFit",
        imageClip = true,
    }
end

return SampleAppState
