return {
  { "neovim/nvim-lspconfig",
    config = function()
      require'lspconfig'.solargraph.setup{}
      require'lspconfig'.elmls.setup{}

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.supports_method('referencesProvider') then
            vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.references(nil, { loclist = true })<cr>", { noremap = true, silent = true })
          end
        end,
      })

    end
  }
}
