local g = vim.g
g.moonflyCursorColor = 1
g.moonflyNormalFloat = 1
g.moonflyUndercurls = 1
g.moonflyWinSeparator = 2

vim.cmd [[ colorscheme moonfly ]]

-- cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if cmp_status_ok then
  local winhighlight = {
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
  }

  cmp.setup {
    window = {
      completion = cmp.config.window.bordered(winhighlight),
      documentation = cmp.config.window.bordered(winhighlight),
    },
  }
end

-- lsp

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
  border = "single"
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
  border = "single"
})

-- local win = require("lspconfig.ui.windows")
-- local _default_opts = win.default_opts
--
-- win.default_opts = function (options)
--   local opts = _default_opts(options)
--   opts.border = "single"
--   return opts
-- end
