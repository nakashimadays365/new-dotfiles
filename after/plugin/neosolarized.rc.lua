local status, n = pcall(require, "neosolarized")
if not status then
	return
end

n.setup({
	comment_italics = true,
})

local cb = require("colorbuddy.init")
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

Color.new("black", "#000000")
Color.new("sample", "#bcc2c4")
Color.new("normalBlue", "#9eaeb6")
Color.new("normalGray", "#8c9ca3")
Color.new("baseLine", "#003633")
Color.new("lineColor", "#002636")
Color.new("columnColor", "#8f989c")
Color.new("lineColor2", "#29465B")
-- #9eaeb6
--#6bbdd1

-- Group.new("CursorColumn", colors.none, colors.base03, styles.NONE, colors.base1)
Group.new("CursorColumn", colors.none, colors.lineColor2, styles.NONE, colors.base1)
-- Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
Group.new("CursorLine", colors.none, colors.lineColor2, styles.NONE, colors.base1)
Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new("Visual", colors.none, colors.base03, styles.reverse)
Group.new("Normal", colors.sample, colors.none, styles.NONE)
Group.new("@variable", colors.normalBlue, colors.none, styles.NONE)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

Group.new("HoverBorder", colors.yellow, colors.none, styles.NONE)
