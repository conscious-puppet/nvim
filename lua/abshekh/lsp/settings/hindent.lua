local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING
local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING
--
-- return h.make_builtin({
--   name = "hindent",
--   meta = {
--     url = "https://github.com/mihaimaruseac/hindent",
--     description = "haskell source code formatter",
--   },
--   method = { FORMATTING, RANGE_FORMATTING },
--   filetypes = { "haskell" },
--   generator_opts = {
--     command = "hindent",
--     args = h.range_formatting_args_factory({ "echo", "\"$TEXT\"", "hindent;", "echo" }, "", nil, nil),
--     to_stdin = true,
--   },
--   factory = h.formatter_factory,
-- })



return { range = h.make_builtin({
  name = "hindent_range",
  meta = {
    url = "https://github.com/mihaimaruseac/hindent",
    description = "haskell source code formatter",
  },
  method = RANGE_FORMATTING,
  filetypes = { "haskell" },
  generator_opts = {
    command = "hindent",
    args = h.range_formatting_args_factory({ "$TEXT" }, "", nil, nil),
    to_stdin = false,
  },
  factory = h.formatter_factory,
}),
  all = h.make_builtin({
    name = "hindent_all",
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
  }) }
