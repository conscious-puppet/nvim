-- local cmd = vim.api.nvim_create_autocmd
local create_command = vim.api.nvim_create_user_command


local function woman()
  local telescope_builtin_status_ok, telescope_builtin = pcall(require, "telescope.builtin")
  if not telescope_builtin_status_ok then
    return
  end
  telescope_builtin.man_pages({ previewer = false })

end

create_command("Woman", woman, { desc = "Man Pages" })
create_command("MYVIMRC", ":e $MYVIMRC", { desc = "Edit Neovim Config" })
create_command("CDC", ":cd %:p:h", { desc = "Change Global dir to current file" })
create_command("LDC", ":cd %:p:h", { desc = "Change Local dir to current file" })
create_command("Vterm", ":vsp | term", { desc = "Terminal in vertical split" })
create_command("Sterm", ":sp | term", { desc = "Terminal in horizontal split" })
create_command("Nomodifiable", ":set noma", { desc = "Set no modifiable" })
create_command("Modifiable", ":set ma", { desc = "Set modifiable" })
-- create_command("Bufname", ":keepalt file", { desc = "Rename buffer" })
create_command("Filetype", ":set filetype", {desc = "Set filetype"})


  -- command! -nargs=1 MyCommand call s:MyFunc(myParam)
vim.cmd [[  
	:command -nargs=1 Bufname keepalt file <args>
	:command -nargs=1 Type set filetype <args>

  function! NewScratchTab(...)
      tabnew
      execute printf('set filetype=%s', a:1)
  endfunction

	:command -nargs=1 Scratch call NewScratchTab(<f-args>)
]]

vim.cmd [[ 
  augroup neovim_terminal
      autocmd!
      " Enter Terminal-mode (insert) automatically
      autocmd TermOpen * startinsert
      " Disables number lines on terminal buffers
      autocmd TermOpen * :set nonumber norelativenumber
      " allows you to use Ctrl-c on terminal window
      autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
  augroup END

  au BufNewFile,BufRead *.log :setl ft=json
]]
