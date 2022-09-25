-- local _theme = "onedark"
-- vim.cmd("colorscheme " .. _theme)

require('onedark').setup({
  customTelescope = true
})

-- override highlight
vim.api.nvim_set_hl(0, "diffAdded", { bg = "#283b4d" })
vim.api.nvim_set_hl(0, "diffRemoved", { bg = "#352d3d" })
vim.api.nvim_set_hl(0, "diffChanged", { bg = "#272d43" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#e86671", bg = "#1b1f27" })

-- cmp
-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if cmp_status_ok then
--   cmp.setup {
--     window = {
--       documentation = cmp.config.window.bordered(),
--     },
--   }
-- end

-- lsp

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = nil })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = nil })
vim.diagnostic.config({ float = { border = nil } })

-- telescope

local telescope_status_ok, telescope = pcall(require, "telescope")
if telescope_status_ok then
  telescope.setup {
    defaults = {
      borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    }
  }
end

-- packer

local packer_status_ok, packer = pcall(require, "packer")
if packer_status_ok then
  packer.init {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "none" }
      end,
      prompt_border = "none",
    },
  }
end



-- mason

local mason_status_ok, mason = pcall(require, "mason")
if mason_status_ok then
  mason.setup {
    ui = {
      border = "none",
    }
  }
end
