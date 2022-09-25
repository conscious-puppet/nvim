local _theme = "horizon"
vim.cmd("colorscheme " .. _theme)

-- indent-blanklines
local indent_blankline_status_ok, indent_blankline = pcall(require, 'indent_blankline')
if indent_blankline_status_ok then

  indent_blankline.setup {
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
  }
end


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
