return {
    "mitander/flume.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      overrides = {
        syntax_type = "#00a6b6",
      }
    },
    config = function(_, opts)
        require("flume").setup(opts)
        vim.cmd.colorscheme("flume")
    end,
}
