local status, codedark = pcall(require, "vim-code-dark")
if not status then
	return
end

codedark.setup({})

-- Highlighting function
local codedark_term256 = vim.o.termguicolors == true or vim.fn.has("termguicolors") == 1

local function hi(group, fg, bg, attr, sp)
	if fg ~= nil and fg ~= "" then
		vim.cmd("hi " .. group .. " guifg=" .. fg.gui .. " ctermfg=" .. (codedark_term256 and fg.cterm256 or fg.cterm))
	end
	if bg ~= nil and bg ~= "" then
		vim.cmd("hi " .. group .. " guibg=" .. bg.gui .. " ctermbg=" .. (codedark_term256 and bg.cterm256 or bg.cterm))
	end
	if attr ~= nil and attr ~= "" then
		vim.cmd("hi " .. group .. " gui=" .. attr .. " cterm=" .. attr)
	end
	if sp ~= nil and sp ~= "" then
		vim.cmd("hi " .. group .. " guisp=" .. sp.gui)
	end
end

-- Color definitions:

-- Terminal colors (base16):
local cterm = {
	cterm00 = "00",
	cterm03 = "08",
	cterm05 = "07",
	cterm07 = "15",
	cterm08 = "01",
	cterm0A = "03",
	cterm0B = "02",
	cterm0C = "06",
	cterm0D = "04",
	cterm0E = "05",
}

if vim.g.base16colorspace and vim.g.base16colorspace == "256" then
	cterm.cterm01 = "18"
	cterm.cterm02 = "19"
	cterm.cterm04 = "20"
	cterm.cterm06 = "21"
	cterm.cterm09 = "16"
	cterm.cterm0F = "17"
else
	cterm.cterm01 = "00"
	cterm.cterm02 = "08"
	cterm.cterm04 = "07"
	cterm.cterm06 = "07"
	cterm.cterm09 = "06"
	cterm.cterm0F = "03"
end

-- General appearance colors:

-- Transparent background
if vim.g.codedark_transparent == nil then
	vim.g.codedark_transparent = 0
end

if vim.g.codedark_modern == nil then
	vim.g.codedark_modern = 0
end

local function createColor(gui, cterm, cterm256)
	return { gui = gui, cterm = cterm, cterm256 = cterm256 }
end

local s = {
	cdNone = createColor("NONE", "NONE", "NONE"),
	cdFront = createColor("#D4D4D4", cterm.cterm05, "188"),
	cdBack = createColor("#1E1E1E", cterm.cterm00, "234"),
	cdTabCurrent = createColor("#1E1E1E", cterm.cterm00, "234"),
	cdTabOther = createColor("#2D2D2D", cterm.cterm01, "236"),
	cdTabOutside = createColor("#252526", cterm.cterm01, "235"),
	cdLeftDark = createColor("#252526", cterm.cterm01, "235"),
	cdLeftMid = createColor("#373737", cterm.cterm03, "237"),
	cdLeftLight = createColor("#3F3F46", cterm.cterm03, "238"),
	cdPopupFront = createColor("#BBBBBB", cterm.cterm06, "250"),
	cdPopupBack = createColor("#2D2D30", cterm.cterm01, "236"),
	cdPopupHighlightBlue = createColor("#073655", cterm.cterm0D, "24"),
	cdPopupHighlightGray = createColor("#3D3D40", cterm.cterm03, "237"),
	cdSplitLight = createColor("#898989", cterm.cterm04, "245"),
	cdSplitDark = createColor("#444444", cterm.cterm03, "238"),
	cdSplitThumb = createColor("#424242", cterm.cterm04, "238"),
	cdCursorDarkDark = createColor("#222222", cterm.cterm01, "235"),
	cdCursorDark = createColor("#51504F", cterm.cterm03, "239"),
	cdCursorLight = createColor("#AEAFAD", cterm.cterm04, "145"),
	cdSelection = createColor("#264F78", cterm.cterm03, "24"),
	cdLineNumber = createColor("#5A5A5A", cterm.cterm04, "240"),
	cdDiffRedDark = createColor("#4B1818", cterm.cterm08, "52"),
	cdDiffRedLight = createColor("#6F1313", cterm.cterm08, "52"),
	cdDiffRedLightLight = createColor("#FB0101", cterm.cterm08, "09"),
	cdDiffGreenDark = createColor("#373D29", cterm.cterm0B, "237"),
	cdDiffGreenLight = createColor("#4B5632", cterm.cterm09, "58"),
	cdDiffBlueLight = createColor("#87d7ff", cterm.cterm0C, "117"),
	cdDiffBlue = createColor("#005f87", cterm.cterm0D, "24"),
	cdSearchCurrent = createColor("#4B5632", cterm.cterm09, "58"),
	cdSearch = createColor("#773800", cterm.cterm03, "94"),
	cdGray = createColor("#808080", cterm.cterm04, "08"),
	cdViolet = createColor("#646695", cterm.cterm04, "60"),
	cdBlue = createColor("#569CD6", cterm.cterm0D, "75"),
	cdDarkBlue = createColor("#223E55", cterm.cterm0D, "73"),
	cdLightBlue = createColor("#9CDCFE", cterm.cterm0C, "117"),
	cdGreen = createColor("#6A9955", cterm.cterm0B, "65"),
	cdBlueGreen = createColor("#4EC9B0", cterm.cterm0F, "43"),
	cdLightGreen = createColor("#B5CEA8", cterm.cterm09, "151"),
	cdRed = createColor("#F44747", cterm.cterm08, "203"),
	cdOrange = createColor("#CE9178", cterm.cterm0F, "173"),
	cdLightRed = createColor("#D16969", cterm.cterm08, "167"),
	cdYellowOrange = createColor("#D7BA7D", cterm.cterm0A, "179"),
	cdYellow = createColor("#DCDCAA", cterm.cterm0A, "187"),
	cdPink = createColor("#C586C0", cterm.cterm0E, "176"),
	cdSilver = createColor("#C0C0C0", cterm.cterm05, "7"),
}

hi("Visual", s.cdNone, s.cdGreen, "none", {})
