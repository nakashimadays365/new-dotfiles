local keymap = vim.keymap
local cmd = vim.cmd
local opts = { noremap = true, silent = true }

vim.g.mapleader = "<Space>"

-- keymap.set("n", "<Space>", "<leader>")
keymap.set("n", "x", '"_x')

-- ESC*2 でハイライトやめる
keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", "JK", "<ESC>", opts)
keymap.set("i", "Jk", "<ESC>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", ":tabedit")
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
-- Move window
-- keymap.set('n', '<Space>', '<C-w>w')
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

--fast move
keymap.set("n", "J", "10j")
keymap.set("n", "K", "10k")
keymap.set("n", "H", "0")
keymap.set("n", "L", "$")

-- diff view open keymap
keymap.set("n", "do", ":DiffviewOpen<CR>")
keymap.set("n", "dc", ":DiffviewClose<CR>")

-- trouble open keymap
keymap.set("n", "tt", ":TroubleToggle<CR>")

-- dap keymap
keymap.set("n", "dgo", ":lua require'dap'.continue()<CR>")
keymap.set("n", "dgb", ":lua require'dap'.step_over()<CR>")
keymap.set("n", "dgi", ":lua require'dap'.step_into()<CR>")
keymap.set("n", "dro", ":lua require'dap'.step_out()<CR>")
keymap.set("n", "sb", ":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "sB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "dlp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
keymap.set("n", "sdr", ":lua require'dap'.repl.open()<CR>")
keymap.set(
	"n",
	"sdl",
	":lua require'dap'.run_last() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"
)

-- jump command
-- keymap.set("n", "fj", "<Plug>(jumpcursor-jump)", {})

-- markdownpreview
keymap.set("n", "md", ":MarkdownPreview<CR>")

keymap.set("n", "gd", '<cmd> lua require"telescope.builtin".lsp_definitions()<CR>', { noremap = true, silent = true })

keymap.set("n", "gi", '<cmd>lua require"telescope.builtin".lsp_references()<CR>', { noremap = true, silent = true })

-- MiniMap
keymap.set("n", "mc", "<cmd>lua MiniMap.close()<CR>")
keymap.set("n", "mf", "<cmd>lua MiniMap.toggle_focus()<CR>")
keymap.set("n", "mo", "<cmd>lua MiniMap.open()<CR>")
keymap.set("n", "mr", "<cmd>lua MiniMap.refresh()<CR>")
keymap.set("n", "ms", "<cmd>lua MiniMap.toggle_side()<CR>")
keymap.set("n", "mt", "<cmd>lua MiniMap.toggle()<CR>")

--
-- open tree
keymap.set("n", "<C-o>", ":OpenTree<CR>")

keymap.set("n", "re", "<cmd>lua vim.cmd([[%!cat %]])<CR>", { noremap = true, silent = true })
keymap.set("n", "ff", ":EnableLspFormatting<CR>")
keymap.set("n", "fn", ":DisableNullFormatting<CR>")
keymap.set("n", "fl", ":DisableLspFormatting<CR>")
