local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local sources = {
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish
}


null_ls.setup({ sources = sources })
