return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "jfpedroza/neotest-elixir",
    "olimorris/neotest-rspec",
    'stevearc/overseer.nvim',
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-elixir"),
        require("neotest-rspec"),
        require('rustaceanvim.neotest')
      },
      consumers = {
        overseer = require("neotest.consumers.overseer")
      },
    })
  end
}
