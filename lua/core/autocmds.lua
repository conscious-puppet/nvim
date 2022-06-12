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


-- Open terminal in insert mode
vim.cmd [[ autocmd TermOpen * startinsert ]]
