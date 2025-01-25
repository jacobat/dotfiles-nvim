return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'smartpde/telescope-recent-files',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local lga_actions = require("telescope-live-grep-args.actions")
    local actions = require('telescope.actions')
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("recent_files")
    require("telescope").setup {
      defaults = {
        mappings = {
          i = {
            ["<C-f>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        },
      },
      pickers = {
        find_files = {
          theme = "ivy"
        },
      },
      extensions = {
        live_grep_args = {
          theme = "ivy",
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob "}),
              ["<C-s>"] = lga_actions.quote_prompt({ postfix = " --iglob packs/**/*.rb --iglob !**/spec/**"}),
              ["<C-space>"] = actions.to_fuzzy_refine,
            }
          }
        }
      }
    }
  end,
}
