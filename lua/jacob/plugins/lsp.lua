return {
  { "neovim/nvim-lspconfig",
    config = function()
      require'lspconfig'.solargraph.setup{}
      require'lspconfig'.elmls.setup{}
    end
  }
}
