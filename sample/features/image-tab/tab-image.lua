local iui = require "lib.iui"

local function tabImage()
    local windowState = iui.style["windowState"] --- @type SampleWindowState
    local appState = iui.style["appState"]       --- @type SampleAppState

    local assets = iui.style["assets"]           --- @type SampleAssets

    local tabWinState = windowState.imageTab
    local tabState = appState.imageTab

    iui.style.push()
    iui.style["splitMinEdge"] = 200
    iui.style["splitMaxEdge"] = 200
    iui.style["splitSide"] = "max"

    tabWinState.rightSplitValue = iui.splitView(
        "imageSplit",
        "horiz",
        tabWinState.rightSplitValue,
        function()
            local x, y, w, h = iui.layout.getPanelBounds()
            local margin = iui.style["margin"]

            iui.layout.beginRow({ kind = "dynamic", count = 1 }, h - margin * 2)

            iui.style.push()
            iui.style["imageFilter"] = tabState.imageFilter
            iui.style["imageMode"] = tabState.imageFillMode
            iui.style["imageClip"] = tabState.imageClip

            iui.image(assets.gameSunsetImage)

            iui.style.pop()
        end,
        function()
            iui.label("Filter")
            tabState.imageFilter = iui.radio(
                "Nearest", tabState.imageFilter, "nearest"
            )

            tabState.imageFilter = iui.radio(
                "Smooth", tabState.imageFilter, "smooth"
            )

            tabState.imageFilter = iui.radio(
                "Linear", tabState.imageFilter, "linear"
            )

            iui.divider()

            iui.label("Fill Mode")
            tabState.imageFillMode = iui.radio(
                "Fill", tabState.imageFillMode, "fill"
            )

            tabState.imageFillMode = iui.radio(
                "Aspect Fit", tabState.imageFillMode, "aspectFit"
            )

            tabState.imageFillMode = iui.radio(
                "Aspect Fill", tabState.imageFillMode, "aspectFill"
            )

            tabState.imageFillMode = iui.radio(
                "Center", tabState.imageFillMode, "center"
            )

            iui.divider()

            tabState.imageClip = iui.checkbox(
                "Clip to Bounds", tabState.imageClip
            )
        end
    )

    iui.style.pop()
end

return tabImage
