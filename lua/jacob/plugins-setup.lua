packer = require("jacob.packer").setup()

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")
  use('lewis6991/impatient.nvim') -- speedup loading of nvim

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use("bluz71/vim-nightfly-guicolors") -- nightfly colorscheme
  use("sainnhe/everforest") -- everforst color scheme
  use({ "catppuccin/nvim", as = "catppuccin" }) -- catppuccin colorscheme

  use('b4winckler/vim-angry') -- arguments as text objects

  -- For diagnostics output
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  -- Show indentation markers
  use "lukas-reineke/indent-blankline.nvim"

  use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  -- use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- file explorer
  -- use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  -- use("kyazdani42/nvim-web-devicons")

  -- statusline
  use{
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- remove search hilights after search
  -- use("romainl/vim-cool")

  -- git things
  use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  -- use { "lewis6991/gitsigns.nvim", config = function() require('gitsigns').setup() end } -- show line modifications on left hand side
  use('lewis6991/gitsigns.nvim')

  -- buffers
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Ruby
  use({
    -- "tpope/vim-rails",
    "tpope/vim-projectionist",
    "tpope/vim-rake",
    "tpope/vim-bundler",
    ft = { "ruby", "eruby" },
  })

  -- test & rspec
  use({
    'nvim-neotest/neotest',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
    },
    config = require("jacob.neotest").config()
  })

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  use('RRethy/nvim-treesitter-endwise')

  use {
    'AckslD/nvim-trevJ.lua',
    config = require("jacob.trevj").config()
  }

  -- Elixir
  use({ "mhanberg/elixir.nvim", requires = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim"
  }})

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  --use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  --use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use { "ray-x/lsp_signature.nvim", }
  use({ "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({
        -- your configuration
      })
    end,
  }) -- enhanced lsp uis
  -- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  -- use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  -- use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  -- use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-textobjects')

  -- auto closing
  -- use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  -- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration

  if packer_bootstrap then
    require("packer").sync()
  end
end)
