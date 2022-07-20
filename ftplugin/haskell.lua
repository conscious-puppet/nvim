vim.opt_local.iskeyword:append("'")

local map = vim.keymap.set

map("n", "Q", "<cmd>%!hindent<CR>", { buffer = true, noremap = true })
map({ "v", "x" }, "Q", "<esc><cmd>'<,'>!hindent<cr>", { buffer = true, noremap = true })


local cmp_status_ok, cmp = pcall(require, "cmp")
if cmp_status_ok then
  cmp.setup.filetype('haskell', {
    sources = cmp.config.sources({
      {
        name = "nvim_lsp",
        option = {
          keyword_pattern = [[\k\+]],
        }
      },
      {
        name = "buffer",
        option = {
          keyword_pattern = [[\k\+]],
        }
      },
      { name = "path" },
    })
  })
end
