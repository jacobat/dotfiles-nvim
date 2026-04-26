-- LSP configs
-- local lsps = {
--   { "ruby_lsp",
--     {
--       init_options = {
--         addonSettings = {
--           ["Ruby LSP Rails"] = {
--             enablePendingMigrationsPrompt = false,
--           },
--         },
--       },
--     },
--   },
--   { "elmls", {} },
--   -- { "elixirls", {} },
--   { "expert", {
--     cmd = "expert"
--   } },
--   { "luals",
--     {
--       -- Command and arguments to start the server.
--       cmd = { 'lua-language-server' },
--       -- Filetypes to automatically attach to.
--       filetypes = { 'lua' },
--       -- Sets the "workspace" to the directory where any of these files is found.
--       -- Files that share a root directory will reuse the LSP server connection.
--       -- Nested lists indicate equal priority, see |vim.lsp.Config|.
--       root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
--       -- Specific settings to send to the server. The schema is server-defined.
--       -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
--       settings = {
--         Lua = {
--           diagnostics = {
--             globals = { "vim" },
--           },
--           runtime = {
--             version = 'LuaJIT',
--           }
--         }
--       }
--     }
--   },
-- }
--
-- for _, lsp in pairs(lsps) do
--     local name, config = lsp[1], lsp[2]
--     vim.lsp.enable(name)
--     if config then
--         vim.lsp.config(name, config)
--     end
-- end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('referencesProvider') then
      vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.references(nil, { loclist = true })<cr>", { noremap = true, silent = true })
    end
    if client:supports_method('textDocument/codeAction') then
      vim.keymap.set("n", "<leader>rc", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })
    end
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  end,
})

return { "neovim/nvim-lspconfig" }
