require('nvim-tundra').setup({
  transparent_background = false,
  editor = {
    search = {},
    substitute = {},
  },
  syntax = {
    booleans = { bold = true, italic = true },
    comments = { bold = true, italic = true },
    conditionals = {},
    constants = { bold = true },
    functions = {},
    keywords = {},
    loops = {},
    numbers = { bold = true },
    operators = { bold = true },
    punctuation = {},
    strings = {},
    types = { italic = true },
  },
  diagnostics = {
    errors = {},
    warnings = {},
    information = {},
    hints = {},
  },
  plugins = {
    lsp = true,
    treesitter = true,
    cmp = true,
    context = true,
    dbui = true,
    gitsigns = true,
    telescope = true,
  },
  overwrite = {
    colors = {},
    highlights = {},
  },
})

vim.opt.background = 'dark'
local _theme = "tundra"
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
