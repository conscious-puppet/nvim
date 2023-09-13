local status_ok_mason, mason = pcall(require, "mason")
local status_ok_mason_lsp_config, mason_lsp_config = pcall(require, "mason-lspconfig")
local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_ok_lspconfig or not status_ok_mason or not status_ok_mason_lsp_config then
  return
end

mason.setup {
  ui = {
    border = vim.g.border_style,
  }
}

local servers = {
  "lua_ls"
}

mason_lsp_config.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local opts = {
  on_attach = require("abshekh.lsp.handlers").on_attach,
  capabilities = require("abshekh.lsp.handlers").capabilities,
}


-- todo, this is not working
mason_lsp_config.setup_handlers {
  function(server_name) -- default handler (optional)
    lspconfig[server_name].setup(opts)
  end,
  ["lua_ls"] = function()
    local lua_opts = vim.tbl_deep_extend("force",
      require("abshekh.lsp.settings.lua_ls"),
      opts)
    lspconfig.lua_ls.setup(lua_opts)
  end,
  ["hls"] = function()
    lspconfig.hls.setup(opts)
  end,
  ["zls"] = function()
    lspconfig.zls.setup(opts)
  end,
  ["gopls"] = function()
    lspconfig.gopls.setup(opts)
  end,
}
