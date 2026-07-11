return {
    "mitander/flume.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
        require("flume").setup(opts)
        vim.cmd.colorscheme("flume")
    end,
}
