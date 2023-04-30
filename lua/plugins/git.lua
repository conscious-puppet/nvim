return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gg", "<cmd>tab G<cr>", desc = "Open Vim fugitive" },
      -- {"<leader>gb", "<cmd>MerginalToggle<cr>", desc = "Merginal for merge editor"},
      { "<leader>gB", "<cmd>G blame<cr>", desc = "Git blame" },
    },
  },
  {
    "sindrets/diffview.nvim",
    opts = function(_, opts)
      local actions = require("diffview.actions")
      opts.use_icons = false
      opts.view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
        },
        file_history = {
          layout = "diff2_horizontal",
        },
      }
      opts.keymaps = {
        disable_defaults = true,
        view = {
          ["<tab>"] = actions.select_next_entry,
          ["<s-tab>"] = actions.select_prev_entry,
          ["gf"] = actions.goto_file_edit,
          ["<C-w><C-f>"] = actions.goto_file_split,
          ["<C-w>gf"] = actions.goto_file_tab,
          ["<leader>ff"] = actions.focus_files,
          ["<leader>ft"] = actions.toggle_files,
          ["<leader>co"] = actions.conflict_choose("ours"),
          ["<leader>ct"] = actions.conflict_choose("theirs"),
          ["<leader>cb"] = actions.conflict_choose("base"),
          ["<leader>ca"] = actions.conflict_choose("all"),
          ["d1o"] = actions.conflict_choose("all"),
          ["d2o"] = actions.conflict_choose("ours"),
          ["d3o"] = actions.conflict_choose("theirs"),
          ["dx"] = actions.conflict_choose("none"),
          ["<leader>gg"] = "<cmd>DiffviewClose<cr>",
          ["[c"] = "[c",
          ["]c"] = "]c",
          ["[x"] = actions.prev_conflict,
          ["]x"] = actions.next_conflict,
          ["q"] = actions.close,
        },
        diff1 = {
          ["<leader>gg"] = "<cmd>DiffviewClose<cr>",
        },
        diff2 = {
          ["<leader>gg"] = "<cmd>DiffviewClose<cr>",
        },
        diff3 = {
          ["<leader>gg"] = "<cmd>DiffviewClose<cr>",
          { { "n", "x" }, "2do", actions.diffget("ours") },
          { { "n", "x" }, "3do", actions.diffget("theirs") },
        },
        diff4 = {
          ["<leader>gg"] = "<cmd>DiffviewClose<cr>",
          { { "n", "x" }, "d2o", actions.diffget("ours") },
          { { "n", "x" }, "d3o", actions.diffget("theirs") },
        },
        file_panel = {
          ["<leader>gg"] = "<cmd>DiffviewClose<cr>",
          ["j"] = actions.select_next_entry,
          ["k"] = actions.select_prev_entry,
          ["<tab>"] = actions.select_next_entry,
          ["<s-tab>"] = actions.select_prev_entry,
          ["<cr>"] = actions.focus_entry,
          ["zR"] = actions.open_all_folds,
          ["zM"] = actions.close_all_folds,
          ["l"] = actions.focus_entry,
          ["o"] = actions.focus_entry,
          ["<2-LeftMouse>"] = actions.select_entry,
          ["-"] = actions.toggle_stage_entry,
          ["S"] = actions.stage_all,
          ["U"] = actions.unstage_all,
          ["X"] = actions.restore_entry,
          ["L"] = actions.open_commit_log,
          ["<c-b>"] = actions.scroll_view(-0.25),
          ["<c-f>"] = actions.scroll_view(0.25),
          ["gf"] = actions.goto_file_edit,
          ["<C-w>gf"] = actions.goto_file_tab,
          ["i"] = actions.listing_style,
          ["f"] = actions.toggle_flatten_dirs,
          ["R"] = actions.refresh_files,
          ["<leader>ff"] = actions.focus_files,
          ["<leader>ft"] = actions.toggle_files,
          ["g<C-x>"] = actions.cycle_layout,
          ["q"] = "<cmd>DiffviewClose<cr>",
          ["c"] = "<cmd>Git commit<cr>",
          ["p"] = "<cmd>Git! pull<cr>",
          ["P"] = "<cmd>Git! push<cr>",
        },
        file_history_panel = {
          ["<leader>gg"] = "<cmd>DiffviewClose<cr>",
          ["?"] = actions.options,
          ["<C-A-d>"] = actions.open_in_diffview,
          ["y"] = actions.copy_hash,
          ["L"] = actions.open_commit_log,
          ["zR"] = actions.open_all_folds,
          ["zM"] = actions.close_all_folds,
          ["j"] = actions.next_entry,
          ["<down>"] = actions.next_entry,
          ["k"] = actions.prev_entry,
          ["<up>"] = actions.prev_entry,
          ["<cr>"] = actions.focus_entry,
          ["o"] = actions.focus_entry,
          ["l"] = actions.focus_entry,
          ["<2-LeftMouse>"] = actions.select_entry,
          ["<c-b>"] = actions.scroll_view(-0.25),
          ["<c-f>"] = actions.scroll_view(0.25),
          ["<tab>"] = actions.select_next_entry,
          ["<s-tab>"] = actions.select_prev_entry,
          ["gf"] = actions.goto_file,
          ["<C-w><C-f>"] = actions.goto_file_split,
          ["<C-w>gf"] = actions.goto_file_tab,
          ["<leader>e"] = actions.focus_files,
          ["<leader>b"] = actions.toggle_files,
          ["<leader>ff"] = actions.focus_files,
          ["<leader>ft"] = actions.toggle_files,
          ["g<C-x>"] = actions.cycle_layout,
          ["q"] = actions.close,
        },
        option_panel = {
          ["<leader>gg"] = "<cmd>DiffviewClose<cr>",
          ["<tab>"] = actions.select_entry,
          ["q"] = actions.close,
        },
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "]c",
        function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            require("gitsigns").next_hunk()
          end)
          return "<Ignore>"
        end,
        desc = "Next Git hunk",
        expr = true,
        silent = true,
      },
      {
        "[c",
        function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            require("gitsigns").prev_hunk()
          end)
          return "<Ignore>"
        end,
        desc = "Prev Git hunk",
        expr = true,
        silent = true,
      },
    },
  },
}
