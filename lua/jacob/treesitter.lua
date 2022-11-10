require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "ruby", "elixir", "heex", "eex"}, -- only install parsers for elixir and heex
  -- ensure_installed = "all", -- install parsers for all supported languages
  sync_install = false,
  playground = { enable = true },
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
  },
  indent = {
    enable = true
  },
  endwise = {
    enable = true
  },
}
