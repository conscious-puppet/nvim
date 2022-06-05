-- local cmd = vim.api.nvim_create_autocmd
local create_command = vim.api.nvim_create_user_command


local function woman()
  local telescope_builtin_status_ok, telescope_builtin = pcall(require, "telescope.builtin")
  if not telescope_builtin_status_ok then
    return
  end
  telescope_builtin.man_pages({ previewer = false })

end

create_command("Woman", woman, { desc = "Man Pages"})
