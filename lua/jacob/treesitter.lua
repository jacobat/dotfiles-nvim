require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "ruby", "elixir", "heex", "eex"}, -- only install parsers for elixir and heex
  -- ensure_installed = "all", -- install parsers for all supported languages
  sync_install = false,
  playground = { enable = true },
  ignore_install = { },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  highlight = {
    enable = true,
    disable = { },
  },
  indent = {
    enable = false
  },
  endwise = {
    enable = true
  },
}
