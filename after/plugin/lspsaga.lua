local status_ok, lspsaga = pcall(require, "lspsaga")

if not status_ok then
  return
end

lspsaga.setup {
  ui = {
    border = vim.g.border_style,
  },
  lightbulb = {
    enable = false,
  },
  symbol_in_winbar = {
    enable = false,
    -- separator = " 〉",
    separator = " › ",
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
}
