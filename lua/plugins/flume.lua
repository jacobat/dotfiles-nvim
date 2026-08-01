return {
    "mitander/flume.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("flume").setup({ schema = "mira"})
    end,
}
