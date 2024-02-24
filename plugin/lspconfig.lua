local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

require("mason").setup()
require("mason-lspconfig").setup()
local protocol = require("vim.lsp.protocol")

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = 0 })
	print("lsp formatter disable")
end, { nargs = 0 })

vim.api.nvim_create_user_command("EnableLspFormatting", function()
	-- enable_format_on_save 関数を再度呼び出して、フォーマット処理を有効化する
	enable_format_on_save(nil, 0)
	print("all formatter enable")
end, { nargs = 0 })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- client.server_capabilities.semanticTokensProvider = vim.NIL -- treesitterのhighlightをlspがoverrideしてしまう現象を解消するため実装
	-- local function buf_set_keymap(...)
	-- 	vim.api.nvim_buf_set_keymap(bufnr, ...)
	-- end

	--Enable completion triggered by <c-x><c-o>
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- LSP handlers
	vim.lsp.handlers["textDocument/publishDiagnostics"] =
		vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
end

protocol.CompletionItemKind = {
	"", -- Text
	"󰊕", -- Method
	"󰊕", -- Function
	"󰊕", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"󱒌", -- Module
	"", -- Property
	"", -- Unit
	"󰎠", -- Value
	"", -- Enum
	"", -- Keyword
	"", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.gopls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
})

nvim_lsp.golangci_lint_ls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
})

nvim_lsp.intelephense.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		enable_format_on_save(client, bufnr)
	end,
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	root_pattern = { "composer.json", ".git" },
	single_file_support = true,
})

nvim_lsp.vuels.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "vue" },
	root_pattern = { "package.json", "vue.config.js" },
	cmd = { "vls" },
	init_options = {
		config = {
			css = {},
			emmet = {},
			html = {
				suggest = {},
			},
			javascript = {
				format = {},
			},
			stylusSupremacy = {},
			typescript = {
				format = {},
			},
			vetur = {
				completion = {
					autoImport = false,
					tagCasing = "kebab",
					useScaffoldSnippets = false,
				},
				format = {
					defaultFormatter = {
						js = "none",
						ts = "none",
					},
					defaultFormatterOptions = {},
					scriptInitialIndent = false,
					styleInitialIndent = false,
				},
				useWorkspaceDependencies = false,
				validation = {
					script = true,
					style = true,
					template = true,
				},
			},
		},
	},
})

nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
	single_file_support = true,
})

-- local start_time = vim.fn.reltime()
-- nvim_lsp.omnisharp.setup({
-- 	on_attach = function(client, bufnr)
-- 		on_attach(client, bufnr)
-- 		enable_format_on_save(client, bufnr)
-- 		local end_time = vim.fn.reltime()
-- 		local elapsed_time = vim.fn.reltimefloat(end_time) - vim.fn.reltimefloat(start_time)
-- 		local message = string.format("Omnisharp-Mono LSP loaded in %.2f seconds.", elapsed_time)
-- 		vim.notify(message, "info") -- メッセージの表示
-- 	end,
-- 	capabilities = capabilities,
-- 	root_dir = nvim_lsp.util.root_pattern("*.sln"),
-- })

local omnisharp_executable = "omnisharp"
local start_time = vim.fn.reltime()
nvim_lsp.omnisharp.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		enable_format_on_save(client, bufnr)
		capabilities = capabilities
		local end_time = vim.fn.reltime()
		local elapsed_time = vim.fn.reltimefloat(end_time) - vim.fn.reltimefloat(start_time)
		local message = string.format("Omnisharp-Mono LSP loaded in %.2f seconds.", elapsed_time)
		vim.notify(message, "info") -- メッセージの表示
	end,
	cmd = { omnisharp_executable, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	-- enable_editorconfig_support = true, -- setting from .editorconfig
	-- enable_ms_build_load_projects_on_demand = true,
	-- enable_roslyn_analyzers = true,
	-- analyze_open_documents_only = true,
	-- organize_imports_on_format = true,
	-- may result in slow completion responsiveness
	-- enable_import_completion = true,
	-- sdk_include_prereleases = true,
	-- rest of your settings
})

nvim_lsp.elixirls.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
	capabilities = capabilities,
	filetypes = { "elixir", "eelixir", "heex", "surface" },
	root_pattern = { "mix.exs", ".git" },
})

nvim_lsp.html.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
	filetypes = { "html", "ejs", "smarty" },
	capabilities = capabilities,
	cmd = { "vscode-html-language-server", "--stdio" },
})

nvim_lsp.cssls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
	filetypes = { "css", "scss", "less" },
	cmd = { "vscode-css-language-server", "--stdio" },
	settings = {
		css = {
			validate = true,
		},
		less = {
			validate = true,
		},
		scss = {
			validate = true,
		},
	},
})

nvim_lsp.dockerls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
	filetypes = { "dockerfile" },
	cmd = { "docker-langserver", "--stdio" },
	single_file_support = true,
})

nvim_lsp.flow.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
	cmd = { "typescript-language-server", "--stdio" },
})

nvim_lsp.sourcekit.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.svelte.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
	root_pattern = { "package.json", ".git" },
})

nvim_lsp.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
	root_pattern = { "Dockerfile" },
	single_file_support = { true },
})

nvim_lsp.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_dir = nvim_lsp.util.root_pattern({
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git",
	}),
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
