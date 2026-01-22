local ok_ease, ease = pcall(require, "mini.ease")
if ok_ease then
    ease.setup({
        window = { enable = true },
        scroll = { enable = false },
        motion = { enable = true },
    })
end

local ok_anim, animate = pcall(require, "mini.animate")
if ok_anim then
    animate.setup({
        cursor = { enable = false }, -- important with smear-cursor
        scroll = { enable = false }, -- important if you use neoscroll
    })
end
