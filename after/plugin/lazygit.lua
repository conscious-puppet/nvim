local g = vim.g
g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
g.lazygit_floating_window_winblend = 0 -- transparency of floating window
g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
g.lazygit_floating_window_scaling_factor = 1 -- scaling factor for floating window
-- for lazygit to open buffer in neovim itself
vim.cmd [[

  let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
  if has('nvim') && executable('nvr')
    let $GIT_EDITOR = "nvr -cc vsplit --remote-wait +'set bufhidden=wipe'"
  endif
]]
