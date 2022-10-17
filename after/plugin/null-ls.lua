local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end


-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- local hindent_status_ok, hindent = pcall(require, "abshekh.lsp.settings.hindent")
-- if hindent_status_ok then
--   formatting.hindent_all = hindent.all
--   formatting.hindent_range = hindent.range
-- end

null_ls.setup {
  debug = false,
  sources = {
    -- formatting.hindent_all,
    -- formatting.hindent_range,
    code_actions.gitsigns,
    diagnostics.todo_comments,
    -- diagnostics.codespell,
  },
  on_attach = require("abshekh.lsp.handlers").on_attach,
}
