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
-- require("jacob.elixir")

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
