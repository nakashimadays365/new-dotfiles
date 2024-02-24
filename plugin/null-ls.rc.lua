local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end
local h = require("null-ls.helpers")
local u = require("null-ls.utils")

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		timeout_ms = 5000,
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- local client = vim.lsp.get_active_clients()
-- local c = vim.lsp.buf_get_clients()
-- if c.name == "html" then
-- 	print("client client")
-- 	require("null-ls").disable({ "prettier" })
-- end

null_ls.setup({
	sources = {
		formatting.gofmt,
		formatting.stylua,
		formatting.fish_indent,
		formatting.black,
		formatting.csharpier,
		formatting.sql_formatter,
		formatting.phpcbf,
		-- formatting.rustywind,
		formatting.prettier.with({
			prefer_local = "~/.prettierrc",
		}),
		-- formatting.eslint_d,
		diagnostics.eslint_d,
		diagnostics.fish,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})

vim.api.nvim_create_user_command("DisableNullFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
	print("null-ls formatter disable")
end, { nargs = 0 })
