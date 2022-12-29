local lsp = pcall(require, 'lsp-zero')

-- disable it
if true then
  return
end

lsp.preset('recommended')

lsp.ensure_installed {
  'sumneko_lua'
}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings {
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
}

lsp.set_preferences {
  sign_icons = { }
}

lsp.setup_nvim_cmp {
  mappings = cmp_mappings
}

local keymaps = require "abshekh.keymaps.lsp"
lsp.on_attach(function(client, bufnr)
  if vim.g.disable_formatting[client.name] then
    client.server_capabilities.documentFormatting              = false
    client.server_capabilities.documentFormattingProvider      = false
    client.server_capabilities.documentRangeFormatting         = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  keymaps.lsp_keymaps(client, bufnr)
end)

lsp.nvim_workspace()
lsp.setup()
