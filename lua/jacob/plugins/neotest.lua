return {
  "nvim-neotest/neotest",
  dependencies = {
    "jfpedroza/neotest-elixir",
    "olimorris/neotest-rspec",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-elixir"),
        require("neotest-rspec"),
      }
    })
  end
}
