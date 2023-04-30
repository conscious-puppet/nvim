-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "gf", "gF", opts)

-- map("n", "<C-q>", ":bd<CR>", opts) -- close current buffer
map("n", "<C-w>m", "<CMD>tabedit % | norm <C-o> <CR>", opts) -- replicate current buffer into new tab
map("n", "]q", "<CMD>cnext<CR>", opts)
map("n", "[q", "<CMD>cprev<CR>", opts)
map("n", "<C-q>", "<CMD>call QuickFixToggle()<CR>", opts)

-- Ctrl hjkl in command line mode, not needed as nvim-cmp as auto trigger
map("c", "<C-j>", "<C-n>", { noremap = true })
map("c", "<C-k>", "<C-p>", { noremap = true })
map("c", "<C-h>", "<Up>", { noremap = true })
map("c", "<C-l>", "<Down>", { noremap = true })
