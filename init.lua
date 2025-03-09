require("jacob.settings")
require("jacob.keymaps")
require("jacob.plugins")

vim.cmd("colorscheme oldworld")

function run_tests()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, {"test", "text2"})
  local opts = {
    relative = 'cursor',
    border = 'rounded',
    width = 80,
    height = 20,
    col =  0,
    row = 1,
    anchor =  'NW',
    style =  'minimal',
    title = "[ rspec ]",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
end

-- run_tests()

vim.keymap.set('n', "<leader>cpw", function() run_tests() end, {})
vim.keymap.set('v', "<leader>x", "<cmd>'<,'>lua<CR>", { desc = "Execute visual selection" })
vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
