return {
  "nvim-neotest/neotest",
  dependencies = {
    "jfpedroza/neotest-elixir",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-elixir"),
      }
    })
  end
}
