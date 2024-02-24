vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "fish"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.swapfile = false

-- fonts -----------------
-- vim.cmd([[set guifont=iMWritingMono_Nerd_Font:h10]])
vim.cmd([[set guifont=Hack_Nerd_Font_Mono:h10]])
vim.cmd([[set guifontwide=Hack_Nerd_Font_Mono:h10]])
-- :set guifont=courier_new:h12:w5:b:cRUSSIAN
-- :set guifont=Andale_Mono:h7.5:w4.5
-- vim.cmd([[set guifont=Hack\ Nerd\ Font\ Mono\ 13]])
-- vim.cmd([[set guifontwide=Hack\ Nerd\ Font\ Mono\ 13]])
--------------------------

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- treesitterのハイライトをlspがオーバーライドしてしまう現象を対処するため実装
-- vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- NvimTree
-- ----------------------------
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- ----------------------------

if vim.fn.has("nvim-0.10") == 1 then
	vim.otp.smoothscroll = true
end
-- colorscheme
-- ----------------------------
-- vim.cmd([[colorscheme github_dark_dimmed]])
-- vim.cmd([[colorscheme monokai-pro]])
-- vim.cmd([[colorscheme nightfly]])
-- vim.cmd([[colorscheme darkplus]])
-- vim.cmd([[colorscheme vscode]])
-- require("colorbuddy").colorscheme("cobalt2")
-- vim.cmd([[colorscheme abscs]])
-- vim.cmd([[colorscheme lunaperche]])
-- vim.cmd([[colorscheme material-darker]])
-- vim.cmd([[colorscheme evening]])
-- vim.cmd([[colorscheme murphy]])
-- vim.cmd([[colorscheme tender]])
--
-- vim.cmd("colorscheme kanagawa-wave")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme kanagawa-lotus")
--
-- vim.cmd("colorscheme paramount")
-- vim.cmd("colorscheme oxocarbon")
--
vim.cmd("colorscheme solarized-osaka")
-- vim.cmd("colorscheme cyberdream")
-- vim.cmd("colorscheme codedark")
-- vim.g.nightflyCursorColor = true
-- vim.g.nightflyNormalFloat = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- 現在のカラースキームの一部の色を変更
-- vim.cmd([[highlight Constant ctermfg=140 guifg=#595fff]])
-- vim.cmd([[highlight Statement ctermfg=243 guifg=#529ACB]])
-- vim.cmd([[highlight Visual ctermfg=251 ctermbg=140 guifg=#262626 guibg=#5fd7a7]])
--
-- vim.cmd([[highlight Identifier ctermfg=51 guifg=#dbdbdb]])
-- vim.cmd([[highlight Question ctermfg=46 guifg=#00ffff]])
-- vim.cmd([[highlight Type ctermfg=46  guifg=#2dfc2d]])
-- vim.cmd([[highlight LineNr ctermfg=226 guifg=#dbdbdb]])
-- vim.cmd([[highlight Visual ctermfg=231 ctermbg=246 guifg=#ffffff guibg=#999999]])
-- vim.cmd([[highlight Visual ctermfg=231 ctermbg=246 guifg=#ffffff guibg=#5f87af]])
-- vim.cmd([[highlight Statement ctermfg=227 guifg=#dede00]])

-- ------------------------------
vim.cmd([[
  augroup EjsTplFiletype
    autocmd!
    autocmd BufNewFile,BufRead *.ejs setfiletype html
    autocmd BufNewFile,BufRead *.tpl setfiletype html
  augroup END
]])
-- ------------------------------
