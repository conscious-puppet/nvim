require("abshekh.lsp.settings.nvim-jdtls")

local disable_codelens = vim.g.disable_codelens
disable_codelens.jdtls = true
vim.g.disable_formatting = disable_codelens
