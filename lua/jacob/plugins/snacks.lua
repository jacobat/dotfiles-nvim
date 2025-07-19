return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    image = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      layout = "ivy",
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      "<leader>tt",
      function() 
        Snacks.picker.files(
          {
            args = { "--no-require-git" },
          }
        )
      end,
      desc = "Snacks global files picker"
    },
    {
      "<leader>tsf",
      function() 
        Snacks.picker.files(
          {
            args = { "--no-require-git" },
            exclude = { "spec", "test" },
          }
        )
      end,
      desc = "Snacks files picker excluding specs"
    },
    {
      "<leader>tp",
      function() 
        Snacks.picker.files(
          {
            args = { "--no-require-git" },
            dirs = { "packs" },
          }
        )
      end,
      desc = "Snacks files picker scoped to packs"
    },
  },
}
