return {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    require("telescope").load_extension("fzf")
  end,
}
