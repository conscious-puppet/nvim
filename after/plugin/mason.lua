local status_ok_mason, mason = pcall(require, "mason")
local status_ok_mason_lsp_config, mason_lsp_config = pcall(require, "mason-lspconfig")
local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_ok_lspconfig or not status_ok_mason or not status_ok_mason_lsp_config then
  return
end

mason.setup {
  ui = {
    border = "single",
  }
}

local servers = {
  "sumneko_lua",
}

mason_lsp_config.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local opts = {
  on_attach = require("abshekh.lsp.handlers").on_attach,
  capabilities = require("abshekh.lsp.handlers").capabilities,
}

mason_lsp_config.setup_handlers {
  function(server_name) -- default handler (optional)
    lspconfig[server_name].setup(opts)
  end,
  ["sumneko_lua"] = function()
    local sumneko_opts = vim.tbl_deep_extend("force",
      require("abshekh.lsp.settings.sumneko_lua"),
      opts)
    lspconfig["sumneko_lua"].setup(sumneko_opts)
  end,
}
