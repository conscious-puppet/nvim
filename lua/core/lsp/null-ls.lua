local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end


-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local hindent_status_ok, hindent = pcall(require, "core.lsp.settings.hindent")
if hindent_status_ok then
  formatting.hindent = hindent
end

null_ls.setup {
  debug = false,
  sources = {
    formatting.hindent,
    diagnostics.flake8,
  },
}
