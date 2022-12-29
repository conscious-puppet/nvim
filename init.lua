vim.g.disable_formatting = {}

require "abshekh.options"
require "abshekh.keymaps.general"
require "abshekh.autocmds"
require "abshekh.commands"
require "abshekh.themes".set()
require "abshekh.packer"
require "abshekh.lsp"

-- horizontal split toggle term
-- nvim dap
-- register | paste registers
-- vim-surround
-- tpope database explorer
-- autosave
-- undo tree
-- focus/zen mode folke


-- Gvdiffsplit!
-- d2o (accept left changes)  | diffget
-- d3o (accept right changes) |

-- lsp handlers, code lens and debugger
-- extract all keymaps into one place
-- update lsp handler code lens, document highlight autocmds. refer to lunarvim
-- put all icons in one place
-- change error curly to simple underline
