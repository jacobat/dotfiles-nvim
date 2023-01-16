require('impatient')

require("jacob.options")
require("jacob.plugins-setup")
require("jacob.telescope")
require("jacob.keymaps")
require("jacob.colorscheme")
require("jacob.lualine")
require("jacob.comment")
require("jacob.cmp")
require("jacob.neotest")
require("jacob.treesitter")
require("jacob.gitsigns")
require("jacob.lspconfig")
require("jacob.lsp_signature")
require("neogit").setup()
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
