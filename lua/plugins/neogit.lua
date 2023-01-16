return {
  'TimUntersberger/neogit',
  enabled = false;
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    require("neogit").setup()
  end
}
