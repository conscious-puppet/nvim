local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

return h.make_builtin({
  name = "hindent",
  meta = {
    url = "https://github.com/mihaimaruseac/hindent",
    description = "haskell source code formatter",
  },
  method = FORMATTING,
  filetypes = { "haskell" },
  generator_opts = {
    command = "hindent",
    to_stdin = true,
  },
  factory = h.formatter_factory,
})
