require "abshekh.options"
require "abshekh.keymaps.general"
require "abshekh.autocmds"
require "abshekh.commands"
require "abshekh.themes".set()
require "abshekh.packer"
require "abshekh.lsp"

-- 1g<C-a> -- increment selection by 1
-- 1g<C-x> -- decrement selection by 1
-- split and then we can diff files
-- :windo diffthis
-- :diffupdate
-- :diffoff!

-- change shells 
-- chsh -s $(which fish)

-- tab G | vnew | exe "normal! \<C-w>\<C-w>" | vertical resize 36


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

-- diffget LO, local
-- diffget RE, remote
-- diffget BA, base

-- lsp handlers, code lens and debugger
-- extract all keymaps into one place
-- update lsp handler code lens, document highlight autocmds. refer to lunarvim
-- put all icons in one place
-- change error curly to simple underline

-- :e +line_num file_name
