-- Library of 40+ independent Lua modules improving Neovim experience with minimal effort
return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- Neovim Lua plugin to extend and create `a`/`i` textobjects.
    require('mini.ai').setup()
    -- Neovim Lua plugin with fast and feature-rich surround actions
    require('mini.surround').setup()
  end
}
