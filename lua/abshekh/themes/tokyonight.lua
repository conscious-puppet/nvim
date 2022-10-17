local tokyonight_status, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status then
  return
end

tokyonight.setup({
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true,
  styles = {
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
})

vim.cmd [[colorscheme tokyonight]]

-- vim.o.pumblend = 15 -- for tranparency
-- override highlight
vim.api.nvim_set_hl(0, "diffAdded", { bg = "#283b4d" })
vim.api.nvim_set_hl(0, "diffRemoved", { bg = "#352d3d" })
vim.api.nvim_set_hl(0, "diffChanged", { bg = "#272d43" })


-- cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if cmp_status_ok then
  local border = cmp.config.window.bordered()
  border.border = "single"
  border.winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None"
  cmp.setup {
    window = {
      documentation = border,
      completion = border
    },
  }
end

-- lsp

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
-- vim.diagnostic.config({ float = { border = "single" } })

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
      results_title = false,
    }
  }
end
