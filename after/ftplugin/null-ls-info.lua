local theme = vim.g.colors_name

if theme ~= "onedark" then
  vim.api.nvim_win_set_config(vim.api.nvim_get_current_win(), { border = "single", height = 25 })
end
