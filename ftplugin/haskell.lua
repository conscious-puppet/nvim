vim.opt_local.iskeyword:append("'")

local map = vim.keymap.set

map("n", "Q", "<cmd>%!hindent<CR>", { buffer = true, noremap = true })
map({ "v", "x" }, "Q", "<esc><cmd>'<,'>!hindent<cr>", { buffer = true, noremap = true })
