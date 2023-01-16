return {
  { "catppuccin/nvim", name = "catppuccin" }, -- catppuccin colorscheme

  -- 'lewis6991/impatient.nvim', -- speedup loading of nvim

  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  "bluz71/vim-nightfly-guicolors", -- nightfly colorscheme
  "sainnhe/everforest", -- everforst color scheme

  "b4winckler/vim-angry", -- arguments as text objects

  -- use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  -- Show indentation markers
  "lukas-reineke/indent-blankline.nvim",

  "szw/vim-maximizer", -- maximizes and restores current window

  -- essential plugins
  "tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
  "vim-scripts/ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

  -- file explorer
  -- use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  -- use("kyazdani42/nvim-web-devicons")

  -- remove search hilights after search
  -- use("romainl/vim-cool")

  -- git things
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- use { "lewis6991/gitsigns.nvim", config = function() require('gitsigns').setup() end } -- show line modifications on left hand side
  'lewis6991/gitsigns.nvim',
--
--   -- buffers
--   use {
--     'akinsho/bufferline.nvim',
--     tag = "v3.*",
--     requires = 'kyazdani42/nvim-web-devicons'
--   }
--
  -- Ruby
  {
    -- "tpope/vim-rails",
    "tpope/vim-projectionist",
    "tpope/vim-rake",
    "tpope/vim-bundler",
    ft = { "ruby", "eruby" },
  },

  -- test & rspec
  {
    'nvim-neotest/neotest',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
    },
 --   config = require("jacob.neotest").config()
  },

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder

  -- autocompletion
  "hrsh7th/nvim-cmp", -- completion plugin
  "hrsh7th/cmp-buffer", -- source for text in buffer
  "hrsh7th/cmp-path", -- source for file system paths
  'RRethy/nvim-treesitter-endwise',

  -- Elixir
  { "mhanberg/elixir.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim"
    }
  },

  -- snippets
  "L3MON4D3/LuaSnip", -- snippet engine
  "saadparwaiz1/cmp_luasnip", -- for autocompletion
  "rafamadriz/friendly-snippets", -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  --use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  --use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  "neovim/nvim-lspconfig", -- easily configure language servers
  "hrsh7th/cmp-nvim-lsp", -- for autocompletion
  "ray-x/lsp_signature.nvim",

  -- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  -- use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  -- use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  -- use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
--   use('nvim-treesitter/playground')
  'nvim-treesitter/nvim-treesitter-textobjects',

  -- auto closing
  -- use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  -- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
}

