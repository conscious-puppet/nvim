local project_nvim_status, project_nvim = pcall(require, "project_nvim")

if not project_nvim_status then
  return
end

project_nvim.setup {
  manual_mode = true,
}

function _ADD_CURR_DIR_TO_PROJECTS()
  local historyfile = require("project_nvim.utils.path").historyfile
  local curr_directory = vim.fn.expand("%:p:h")
  vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
end

vim.cmd("command! AddProject lua _ADD_CURR_DIR_TO_PROJECTS()")
