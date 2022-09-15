local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_ok_lspconfig then
  return
end

local opts = {
  on_attach = require("abshekh.lsp.handlers").on_attach,
  capabilities = require("abshekh.lsp.handlers").capabilities,
}

local sumneko_opts = vim.tbl_deep_extend("force",
  require("abshekh.lsp.settings.sumneko_lua"),
  opts)
lspconfig.sumneko_lua.setup(sumneko_opts) -- lua

-- local jsonls_opts = vim.tbl_deep_extend("force",
--   require("abshekh.lsp.settings.jsonls"),
--   opts)
-- lspconfig.jsonls.setup(jsonls_opts)

lspconfig.hls.setup(opts) -- haskell
lspconfig.tsserver.setup(opts) -- typescript
lspconfig.jsonls.setup(opts) -- json
