-- lua/core/cssvarhighlight.lua
local ok_css, cssvar = pcall(require, "CSSVarHighlight")
if ok_css then
    cssvar.setup({
        -- defaults are fine; customize if you want:
        -- filename_to_track = "main", -- looks for main.css (without extension)
        -- parent_search_limit = 5,
    })
end

local ok_mini, hipatterns = pcall(require, "mini.hipatterns")
if not ok_mini then
    return
end

hipatterns.setup({
    highlighters = {
        -- keep/add other highlighters here if you want later
        css_variables = ok_css and cssvar.get_settings() or nil,
    },
})
