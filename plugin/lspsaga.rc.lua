local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	finder = {
		methods = {
			tyd = "textDocument/typeDefinition",
		},
	},
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	request_timeout = 5000,
	symbol_in_winbar = {
		enable = true,
		separator = " ",
		ignore_patterns = {},
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},
	lightbulb = {
		enable = false,
	},
})

local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<C-f>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- vim.keymap.set("n", "<C-b>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
-- vim.keymap.set("n", "gd", "<Cmd>Lspsaga show_diagnostic<CR>", opts)
-- vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_buf_diagnostics<CR>", opts)
vim.keymap.set("n", "F", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "fe", "<Cmd>Lspsaga finder ref+def<CR>", opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)

-- code action
-- local codeaction = require("lspsaga.codeaction")
-- vim.keymap.set("n", "ca", function()
-- 	codeaction:code_action()
-- end, { silent = true })
-- vim.keymap.set("v", "ca", function()
-- 	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
-- 	codeaction:range_code_action()
-- end, { silent = true })
