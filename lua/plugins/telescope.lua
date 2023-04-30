local _, telescope = pcall(require, "telescope.builtin")
local _, actions = pcall(require, "telescope.actions")

local function getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        wrap_results = true,
        sorting_strategy = "ascending",
        scroll_strategy = "limit",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.50,
          },
          -- width = 0.87,
          -- height = 0.80,
          width = function(_, max_columns, _)
            return max_columns
          end,
          height = function(_, _, max_lines)
            return max_lines
          end,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-l>"] = actions.cycle_history_next,
            ["<C-h>"] = actions.cycle_history_prev,
            ["<C-c>"] = actions.close,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },
          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["<C-l>"] = actions.cycle_history_next,
            ["<C-h>"] = actions.cycle_history_prev,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        buffers = {
          initial_mode = "normal",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
        git_branches = {
          initial_mode = "normal",
        },
      },
    },
    keys = {
      { "<leader>/", telescope.live_grep, desc = "Live Grep" },
      {
        "<leader>/",
        function()
          local text = getVisualSelection()
          telescope.live_grep({ default_text = text })
        end,
        desc = "Live Grep",
        mode = "v",
      },
      { "<leader><leader>", telescope.find_files, desc = "Find Files" },
      { "<leader>,", telescope.buffers, desc = "Buffers" },
    },
  },
  { "nvim-telescope/telescope-media-files.nvim" },
  {
    "nvim-telescope/telescope-smart-history.nvim",
    dependencies = "kkharji/sqlite.lua",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      {
        "<leader>sB",
        ":Telescope file_browser path=%:p:h=%:p:h<CR>",
        desc = "Browse Files",
      },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}
