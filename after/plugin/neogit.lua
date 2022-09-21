local status_ok_neogit, neogit = pcall(require, "neogit")
if not status_ok_neogit then
  return
end

neogit.setup {
  signs = {
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true
  }
}
