local _theme = "tokyodark"
vim.cmd("colorscheme " .. _theme)

-- cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if cmp_status_ok then
  cmp.setup {
    window = {
      documentation = cmp.config.window.bordered(),
    },
  }
end

-- lsp

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
vim.diagnostic.config({ float = { border = "single" } })

-- telescope

-- local telescope_status_ok, telescope = pcall(require, "telescope")
-- if telescope_status_ok then
--   telescope.setup {
--     defaults = {
--       borderchars = { "", "", "", "", "", "", "", "" },
--     }
--   }
-- end
