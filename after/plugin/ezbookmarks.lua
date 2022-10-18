local telescope_status_ok, _ = pcall(require, "telescope")
local ezbookmarks_status_ok, ezbookmarks = pcall(require, "ezbookmarks")

if not telescope_status_ok or not ezbookmarks_status_ok then
  return
end

ezbookmarks.setup{
  cwd_on_open = 0,
  use_bookmark_dir = 0,
  open_new_tab = 0,
}
