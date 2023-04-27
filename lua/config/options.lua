-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local set = vim.opt

set.timeout = false -- don't timeout on pressing leader key
set.fillchars = set.fillchars + "diff:╱" + "fold: "
set.nrformats = set.nrformats + "alpha" -- increment aplhabets as well

vim.cmd([[ autocmd FileType * set formatoptions-=o ]]) -- don't continue comments
vim.cmd([[ autocmd User TelescopePreviewerLoaded setlocal wrap nu ]]) -- wrap + line number telescope
vim.cmd([[ set diffopt+=vertical ]]) -- vertical fugitive diffs

-- vim.cmd.colorscheme("tokyonight")
