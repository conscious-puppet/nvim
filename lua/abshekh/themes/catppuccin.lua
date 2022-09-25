local g = vim.g
g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]


local catppuccin = require("catppuccin")
local cp = require("catppuccin.palettes").get_palette() -- fetch colors from palette

catppuccin.setup {
  compile = {
    enabled = true,
    path = vim.fn.stdpath("cache") .. "/catppuccin",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    lsp_trouble = true,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    dap = {
      enabled = false,
      enable_ui = false,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    neogit = true,
    markdown = true,
    ts_rainbow = true,
  },
  -- custom_highlights = {
  --   TelescopeNormal = { fg = cp.red, bg = cp.red },
  --   TelescopeBorder = { fg = cp.red },
  --   -- TelescopePromptPrefix = { bg = cp.crust },
  --   TelescopePromptNormal = { bg = cp.red },
  --   TelescopeResultsNormal = { bg = cp.red },
  --   TelescopePreviewNormal = { bg = cp.red },
  --   TelescopePromptBorder = { bg = cp.red, fg = cp.crust },
  --   TelescopeResultsBorder = { bg = cp.red, fg = cp.crust },
  --   TelescopePreviewBorder = { bg = cp.red, fg = cp.crust },
  --   -- TelescopePromptTitle = { fg = cp.crust },
  --   -- TelescopeResultsTitle = { fg = cp.text },
  --   -- TelescopePreviewTitle = { fg = cp.crust },
  --   -- NormalFloat = { fg = cp.text, bg = cp.mantle }, -- Normal text in floating windows.
  --   -- FloatBorder = { fg = cp.blue },
  -- }
}


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
