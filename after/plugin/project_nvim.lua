local project_nvim_status, project_nvim = pcall(require, "project_nvim")

if not project_nvim_status then
  return
end

project_nvim.setup {}

local telescope_status, telescope = pcall(require, "telescope")
if telescope_status then
  telescope.load_extension("projects")
  local opts = { noremap = true, silent = true }
  local map = vim.keymap.set
  map("n", "<leader>pp", "<cmd>Telescope projects<cr>", opts)
end
