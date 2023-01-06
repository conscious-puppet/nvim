local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local list = {
  { key = { "l", "<CR>", "o" }, action = "edit" },
  { key = "h", action = "close_node" },
  { key = "v", action = "vsplit" },
  { key = "?", action = "toggle_help" },
  { key = { "<C-]>", "<2-RightMouse>", "." }, action = "cd" },
}

nvim_tree.setup {
  disable_netrw = false,
  hijack_netrw = false,
  hijack_unnamed_buffer_when_opening = false,
  open_on_setup = false,
  renderer = {
    icons = {
      show = {
        folder = false,
        file = false,
        git = false,
      },
    },
  },
  git = {
    enable = false,
  },
  view = {
    mappings = {
      custom_only = false,
      list = list,
    },
  },
  sync_root_with_cwd = false,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false
  },
  actions = {
    change_dir = {
      enable = false,
      global = false,
      restrict_above_cwd = false,
    }
  },
}
