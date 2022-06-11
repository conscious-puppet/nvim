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

map("n", "<leader>ff", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader><leader>", ":Telescope find_files<CR>", opts)

-- Navigate buffers
-- map("n", "<S-l>", ":bnext<CR>", opts)
-- map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<S-l>", ":BufferNext<CR>", opts)
map("n", "<S-h>", ":BufferPrevious<CR>", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Ctrl hjkl in command line mode
map("c", "<C-j>", "<C-n>", { noremap = true })
map("c", "<C-k>", "<C-p>", { noremap = true })
map("c", "<C-h>", "<Up>", { noremap = true })
map("c", "<C-l>", "<Down>", { noremap = true })

-- Improved Terminal Mappings
map("t", "<esc>", "<C-\\><C-n>")
map("t", "jk", "<C-\\><C-n>")
map("t", "<C-h>", "<c-\\><c-n><c-w>h")
map("t", "<C-j>", "<c-\\><c-n><c-w>j")
map("t", "<C-k>", "<c-\\><c-n><c-w>k")
map("t", "<C-l>", "<c-\\><c-n><c-w>l")
