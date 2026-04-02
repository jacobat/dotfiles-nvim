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
          theme = "ivy",
          find_command = {'fd', '--type', 'f', '--no-require-git'}
        },
        grep_string = {
          additional_args = { '--no-require-git' }
        },
        live_grep = {
          additional_args = { '--no-require-git' }
        }
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        live_grep_args = {
          theme = "ivy",
          additional_args = { '--no-require-git' },
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob "}),
              ["<C-s>"] = lga_actions.quote_prompt({ postfix = " --iglob packs/**/*.rb --iglob !**/spec/**"}),
              ["<C-e>"] = lga_actions.quote_prompt({ postfix = " --iglob packs/**/*.rb --iglob !**/spec/** --iglob !packs/eula_sync"}),
              ["<C-space>"] = actions.to_fuzzy_refine,
            }
          }
        }
      }
    }
  end,
}
