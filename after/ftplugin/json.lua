local map = vim.keymap.set

-- map("n", "Q", "<cmd>%!jq .<CR>", { buffer = true, noremap = true })
map("n", "Q", "<cmd>%!jq -R \"fromjson? | . \" -c | jq .<CR>", { buffer = true, noremap = true })
