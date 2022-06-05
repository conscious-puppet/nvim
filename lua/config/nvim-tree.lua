-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local list = {
    { key = { "l", "<CR>", "o" }, action = "edit" },
    { key = "h", action = "close_node" },
    { key = "v", action = "vsplit" },
    { key = "?", action = "toggle_help" },
}

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
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
  }
}
