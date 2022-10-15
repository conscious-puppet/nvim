local g = vim.g
g.tokyonight_style = "storm"
vim.cmd [[colorscheme tokyonight]]

-- override highlight
vim.api.nvim_set_hl(0, "diffAdded", { bg = "#283b4d" })
vim.api.nvim_set_hl(0, "diffRemoved", { bg = "#352d3d" })
vim.api.nvim_set_hl(0, "diffChanged", { bg = "#272d43" })


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

-- packer

local packer_status_ok, packer = pcall(require, "packer")
if packer_status_ok then
  packer.init {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
      prompt_border = "single",
    },
  }
end

-- mason

local mason_status_ok, mason = pcall(require, "mason")
if mason_status_ok then
  mason.setup {
    ui = {
      border = "single",
    }
  }
end


-- telescope

local telescope_status_ok, telescope = pcall(require, "telescope")
if telescope_status_ok then
  telescope.setup {
    defaults = {
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      -- title = false,
      results_title = false,
      -- prompt_title = false,
      -- dynamic_preview_title = false
    },
    live_grep = {
      default_text = "function",
      prompt_title = false,
    }
  }
end
