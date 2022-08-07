local status_ok_mason, mason = pcall(require, "mason")
local status_ok_mason_lsp_config, mason_lsp_config = pcall(require, "mason-lspconfig")

if not status_ok_mason or not status_ok_mason_lsp_config then
  return
end

mason.setup {
  ui = {
    border = "single",
  }
}

local servers = {
  "sumneko_lua",
  "hls,"
}

mason_lsp_config.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("abshekh.lsp.handlers").on_attach,
    capabilities = require("abshekh.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  -- if server == "jsonls" then
  --   local jsonls_opts = require "user.lsp.settings.jsonls"
  --   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  -- end
  --
  -- if server == "yamlls" then
  --   local yamlls_opts = require "user.lsp.settings.yamlls"
  --   opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  -- end

  if server == "sumneko_lua" then
    local sumneko_opts = require("abshekh.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  lspconfig[server].setup(opts)
  -- ::continue::
end
