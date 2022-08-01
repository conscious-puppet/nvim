local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.keymap.set

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


map("n", "//", ":noh<CR>", opts)

map("n", "gf", "gF", opts)
-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- File Related
map("n", "<leader>ft", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ff", "<cmd>NvimTreeFocus<cr>", opts)

-- Telescope
local telescope_status_ok, telescope = pcall(require, "telescope.builtin")

if telescope_status_ok then
  map("n", "<leader>tt", telescope.resume, opts)
  map("n", "<leader>fw", telescope.live_grep, opts)
  map("n", "\\\\", telescope.live_grep, opts)
  map("n", "<leader><leader>", telescope.find_files, opts)
  -- map("n", "<leader><leader>", telescope.find_files, opts, { hidden = true })
  -- map("n", "<leader>gt", telescope.git_status, opts)
  -- map("n", "<leader>gb", telescope.git_branches, opts)
  -- map("n", "<leader>gc", telescope.git_commits, opts)
  map("n", "<leader>fb", telescope.buffers, opts)
  map("n", "<leader>fm", telescope.marks, opts)
  map("n", "<leader>fo", telescope.oldfiles, opts)
  map("n", "<leader>sc", telescope.registers, opts)
  map("n", "<leader>sk", telescope.keymaps, opts)
  map("n", "<leader>sc", telescope.commands, opts)
  map("n", "<leader>ls", telescope.lsp_document_symbols, opts)
  map("n", "<leader>lR", telescope.lsp_references, opts)
  -- map("n", "<leader>lD", telescope.diagnostics, opts)
end

-- Trouble
local trouble_status_ok, _ = pcall(require, "trouble")
if trouble_status_ok then
  map("n", "<leader>ld", "<cmd>Trouble document_diagnostics<cr>", { noremap = true })
  map("n", "<leader>lD", "<cmd>Trouble workspace_diagnostics<cr>", { noremap = true })
  map("n", "<leader>d", "<cmd>Trouble document_diagnostics<cr>", { noremap = true })
  map("n", "<leader>D", "<cmd>Trouble workspace_diagnostics<cr>", { noremap = true })
end


-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Comment
-- map("n", "<leader>/", function() require("Comment.api").toggle_current_linewise() end, opts)
-- map("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", opts)

-- Ctrl hjkl in command line mode, not needed as nvim-cmp as auto trigger
-- map("c", "<C-j>", "<C-n>", { noremap = true })
-- map("c", "<C-k>", "<C-p>", { noremap = true })
-- map("c", "<C-h>", "<Up>", { noremap = true })
-- map("c", "<C-l>", "<Down>", { noremap = true })

-- Improved Terminal Mappings
map("t", "<esc>", "<C-\\><C-n>")
map("t", "<C-h>", "<c-\\><c-n><c-w>h")
map("t", "<C-j>", "<c-\\><c-n><c-w>j")
map("t", "<C-k>", "<c-\\><c-n><c-w>k")
map("t", "<C-l>", "<c-\\><c-n><c-w>l")


-- filetype keymaps
-- haskell
-- vim.cmd[[
--   augroup inform_new_buffer
--     autocmd!
--     autocmd FileType haskell nmap <buffer> Q :%!hindent
--     autocmd FileType haskell vmap <buffer> Q <esc>:!hindent
--   augroup end
-- ]]
