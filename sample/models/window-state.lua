local MainTabWindowState = require "sample.features.main-tab.models.window-state"

--- @alias TabValue "tabA" | "tabB" | "tabC" | "tabD"

--- @class ImageTabWindowState
--- @field leftSplitValue number
--- @field rightSplitValue number

--- @class SampleWindowState
--- @field selectedTab TabValue
--- @field mainTab MainTabWindowState
--- @field imageTab ImageTabWindowState
local SampleWindowState = {}

function SampleWindowState.new()
    --- @type SampleWindowState
    return {
        selectedTab = "tabA",
        mainTab = MainTabWindowState.new(),
        imageTab = {
            leftSplitValue = 200,
            rightSplitValue = 300,
        }
    }
end

return SampleWindowState
