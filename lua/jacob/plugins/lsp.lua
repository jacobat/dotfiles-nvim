return {
  { "neovim/nvim-lspconfig",
    config = function()
      require'lspconfig'.solargraph.setup{}
      require'lspconfig'.elmls.setup{}
      require'lspconfig'.rust_analyzer.setup{}
    end
  }
}
