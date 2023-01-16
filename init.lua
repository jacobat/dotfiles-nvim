-- require('impatient')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("jacob.options")

vim.g.mapleader = " "

require("lazy").setup("plugins")

require("jacob.telescope")
require("jacob.keymaps")
require("jacob.colorscheme")
require("jacob.cmp")
require("jacob.treesitter")
require("jacob.gitsigns")
require("jacob.lspconfig")
require("jacob.lsp_signature")
require("jacob.elixir")
require("jacob.elixir-ls")
-- require("jacob.lsp-saga")
require("jacob.treesitter-textobjects")
require("jacob.mysitter")
require("jacob.projectionist")
require("jacob.indent-blankline")

vim.diagnostic.handlers["my/notify"] = {
  show = function(namespace, bufnr, diagnostics, opts)
    -- In our example, the opts table has a "log_level" option
    local level = opts["my/notify"].log_level

    local name = vim.diagnostic.get_namespace(namespace).name
    local msg = string.format("%d diagnostics in buffer %d from %s",
                              #diagnostics,
                              bufnr,
                              name)
    vim.notify(msg, level)
  end,
}
