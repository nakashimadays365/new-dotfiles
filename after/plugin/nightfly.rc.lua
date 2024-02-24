local status, n = pcall(require, "nightfly")
if not status then
	return
end

local g = vim.g
local highlight = vim.api.nvim_set_hl

-- Variations of midnight-blue
local black = "#011627"
local white = "#c3ccdc"
local black_blue = "#081e2f"
local dark_blue = "#092236"
local deep_blue = "#0e293f"
local slate_blue = "#2c3043"
local pickle_blue = "#38507a"
local regal_blue = "#1d3b53"
local steel_blue = "#4b6479"
local grey_blue = "#7c8f8f"
local cadet_blue = "#a1aab8"
local ash_blue = "#acb4c2"
local white_blue = "#d6deeb"
-- Core theme colors
local yellow = "#e3d18a"
local peach = "#ffcb8b"
local tan = "#ecc48d"
local orange = "#f78c6c"
local orchid = "#e39aa6"
local red = "#fc514e"
local watermelon = "#ff5874"
local violet = "#c792ea"
local purple = "#ae81ff"
local indigo = "#5e97ec"
local blue = "#82aaff"
local malibu = "#87bcff"
local turquoise = "#7fdbca"
local emerald = "#21c7a8"
local green = "#a1cd5e"

highlight(0, "CursorLineNr", { bg = cadet_blue, fg = orange })
highlight(0, "CursorColumn", { bg = cadet_blue })
highlight(0, "CursorLine", { bg = cadet_blue })

highlight(0, "NightflyVisual", { bg = regal_blue })
highlight(0, "NightflyWhite", { fg = white })
highlight(0, "NightflyDeepBlue", { fg = deep_blue })
highlight(0, "NightflyPickleBlue", { fg = pickle_blue })
highlight(0, "NightflySlateBlue", { fg = slate_blue })
highlight(0, "NightflyRegalBlue", { fg = regal_blue })
highlight(0, "NightflySteelBlue", { fg = steel_blue })
highlight(0, "NightflyGreyBlue", { fg = grey_blue })
highlight(0, "NightflyCadetBlue", { fg = cadet_blue })
highlight(0, "NightflyAshBlue", { fg = ash_blue })
highlight(0, "NightflyWhiteBlue", { fg = white_blue })
highlight(0, "NightflyYellow", { fg = yellow })
highlight(0, "NightflyPeach", { fg = peach })
highlight(0, "NightflyTan", { fg = tan })
highlight(0, "NightflyOrchid", { fg = orchid })
highlight(0, "NightflyOrange", { fg = orange })
highlight(0, "NightflyRed", { fg = red })
highlight(0, "NightflyWatermelon", { fg = watermelon })
highlight(0, "NightflyViolet", { fg = violet })
highlight(0, "NightflyPurple", { fg = purple })
highlight(0, "NightflyIndigo", { fg = indigo })
highlight(0, "NightflyBlue", { fg = blue })
highlight(0, "NightflyMalibu", { fg = malibu })
highlight(0, "NightflyTurquoise", { fg = turquoise })
highlight(0, "NightflyEmerald", { fg = emerald })
highlight(0, "NightflyGreen", { fg = green })

highlight(0, "NightflyTurquoiseMode", { bg = turquoise, fg = dark_blue })

highlight(0, "Identifier", { link = "NightflyTurquoise" })

highlight(0, "Label", { link = "NightflyTurquoise" })

highlight(0, "helpHeader", { link = "NightflyTurquoise" })

-- Neovim Tree-sitter
highlight(0, "@constant", { link = "NightflyTurquoise" })
highlight(0, "@namespace", { link = "NightflyTurquoise" })
highlight(0, "@property", { link = "NightflyTurquoise" })
highlight(0, "@string.regex", { link = "NightflyTurquoise" })
highlight(0, "@tag.attribute", { link = "NightflyTurquoise" })

-- Language specific Tree-sitter overrides.
highlight(0, "@parameter.bash", { link = "NightflyTurquoise" })
highlight(0, "@variable.scss", { link = "NightflyTurquoise" })
highlight(0, "@variable.vim", { link = "NightflyTurquoise" })

-- Glyph palette
highlight(0, "GlyphPalette6", { link = "NightflyTurquoise" })

-- Misc items
highlight(0, "jsonBoolean", { link = "NightflyTurquoise" })
highlight(0, "tagName", { link = "NightflyTurquoise" })

-- NvimTree plugin
highlight(0, "NvimTreeSymlink", { fg = turquoise })

-- Telescope plugin
highlight(0, "TelescopePreviewLink", { link = "NightflyTurquoise" })

-- nvim-cmp plugin
highlight(0, "CmpItemKindColor", { link = "NightflyTurquoise" })
highlight(0, "CmpItemKindEnumMember", { link = "NightflyTurquoise" })
highlight(0, "CmpItemKindField", { link = "NightflyTurquoise" })
highlight(0, "CmpItemKindProperty", { link = "NightflyTurquoise" })
highlight(0, "CmpItemKindReference", { link = "NightflyTurquoise" })
highlight(0, "CmpItemKindUnit", { link = "NightflyTurquoise" })
highlight(0, "CmpItemKindValue", { link = "NightflyTurquoise" })
highlight(0, "CmpItemKindVariable", { link = "NightflyTurquoise" })

vim.cmd([[colorscheme nightfly]])
