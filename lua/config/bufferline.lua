local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
   return
end


bufferline.setup {
  closable = false,
  clickable = true,
  icons = false,
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
}
