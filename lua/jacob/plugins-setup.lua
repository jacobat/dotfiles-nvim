-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use("bluz71/vim-nightfly-guicolors") -- nightfly colorscheme
  use("sainnhe/everforest") -- everforst color scheme
  use({ "catppuccin/nvim", as = "catppuccin" }) -- catppuccin colorscheme

  use('b4winckler/vim-angry') -- arguments as text objects

  -- use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  -- use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- file explorer
  -- use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("kyazdani42/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- git things
  use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')

  -- buffers
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- Ruby
  use({
    "tpope/vim-rails",
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
      -- "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-rspec')({
            rspec_cmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rspec",
              })
            end
          }),
        }
      })
    end
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
    config = function() require('trevj').setup({
      containers = {
        lua = {
          table_constructor = {final_separator = ',', final_end_line = true},
          arguments = {final_separator = false, final_end_line = true},
          parameters = {final_separator = false, final_end_line = true},
        },
        ruby = {
          hash = {final_separator = false, final_end_line = true},
          array = {final_separator = false, final_end_line = true},
          arguments = {final_separator = false, final_end_line = true},
          method_parameters = {final_separator = false, final_end_line = true},
        }
      }
    }) end,
    setup = function()
      vim.keymap.set("n", "<leader>k", function()
        require("trevj").format_at_cursor()
      end)
    end,
  }

  -- Elixir
  -- use({ "mhanberg/elixir.nvim", requires = {
  --   "neovim/nvim-lspconfig",
  --   "nvim-lua/plenary.nvim"
  -- }})

  -- snippets
  -- use("L3MON4D3/LuaSnip") -- snippet engine
  -- use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  -- use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  --use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  --use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  -- use("neovim/nvim-lspconfig") -- easily configure language servers
  -- use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  -- use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  -- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  -- use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  -- use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  -- use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  -- use({
  --   "nvim-treesitter/nvim-treesitter",
  --   run = function()
  --     require("nvim-treesitter.install").update({ with_sync = true })
  --   end,
  -- })

  -- auto closing
  -- use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  -- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  -- use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  if packer_bootstrap then
    require("packer").sync()
  end
end)
