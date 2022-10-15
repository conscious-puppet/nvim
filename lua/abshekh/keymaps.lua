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

map("n", "<C-q>", ":bd<CR>", opts) -- close current buffer
map("n", "<C-w>m", ":tabedit %<cr>", opts) -- replicate current buffer into new tab
-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- File Related
map("n", "<leader>ft", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ff", "<cmd>NvimTreeFocus<cr>", opts)

-- map("n", "<leader>g", "<cmd>LazyGit<cr>", opts)
-- map("n", "<leader>g", "<cmd>tab G<cr>", opts)
map("n", "<leader>gg", "<cmd>DiffviewOpen<cr>", opts)

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

-- Telescope
local telescope_status_ok, telescope = pcall(require, "telescope.builtin")

if telescope_status_ok then
  map("n", "<leader>tt", telescope.resume, opts)
  map("n", "<leader>fw", telescope.live_grep, opts)
  -- map("n", "\\\\", telescope.live_grep, opts)
  map("n", "<leader>/", telescope.live_grep, opts)
  map("v", "<leader>/", function ()
    local text = vim.getVisualSelection()
	  telescope.live_grep({ default_text = text })
  end, opts)
  map("n", "<leader><leader>", telescope.find_files, opts)
  -- map("n", "<leader><leader>", telescope.find_files, opts, { hidden = true })
  map("n", "<leader>gs", telescope.git_status, opts)
  map("n", "<leader>gb", telescope.git_branches, opts)
  map("n", "<leader>gc", telescope.git_commits, opts)
  map("n", "<leader>fb", telescope.buffers, opts)
  map("n", "<leader>,", telescope.buffers, opts)
  map("n", "<leader>fm", telescope.marks, opts)
  map("n", "<leader>fo", telescope.oldfiles, opts)
  map("n", "<leader>sc", telescope.registers, opts)
  map("n", "<leader>sk", telescope.keymaps, opts)
  map("n", "<leader>sc", telescope.commands, opts)
  map("n", "<leader>ls", telescope.lsp_document_symbols, opts)
  map("n", "<leader>lR", telescope.lsp_references, opts)
  -- map("n", "<leader>lD", telescope.diagnostics, opts)
  map("n", "<leader>j", telescope.jumplist, opts)
end


-- lsp lines
-- local lsp_lines_status_ok, lsp_lines = pcall(require, "lsp_lines")
-- if lsp_lines_status_ok then
--   map("n", "gl", lsp_lines.toggle, opts)
-- end

-- Trouble
local trouble_status_ok, _ = pcall(require, "trouble")
if trouble_status_ok then
  map("n", "<leader>ld", "<cmd>Trouble document_diagnostics<cr>", { noremap = true })
  map("n", "<leader>lD", "<cmd>Trouble workspace_diagnostics<cr>", { noremap = true })
  map("n", "<leader>d", "<cmd>Trouble document_diagnostics<cr>", { noremap = true })
  map("n", "<leader>D", "<cmd>Trouble workspace_diagnostics<cr>", { noremap = true })
end


local gitsigns_status_ok, _ = pcall(require, "gitsigns")
if gitsigns_status_ok then
  map("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { noremap = true })
  map("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { noremap = true })
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
-- map("t", "<C-h>", "<c-\\><c-n><c-w>h")
-- map("t", "<C-j>", "<c-\\><c-n><c-w>j")
-- map("t", "<C-k>", "<c-\\><c-n><c-w>k")
-- map("t", "<C-l>", "<c-\\><c-n><c-w>l")
