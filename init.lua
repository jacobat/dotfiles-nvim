require("jacob.settings")
require("config.lazy")
require("jacob.keymaps")

vim.cmd("colorscheme oldworld")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'elixir' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'heex' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function() vim.treesitter.start() end,
})

require('nvim-treesitter').install { 'rust', 'javascript', 'ruby', 'elixir', 'lua', 'heex', 'python' }

function first_file_matching(pattern)
  local results = vim.fn.glob(vim.loop.cwd() .. "/" .. pattern, true, true)
  if #results > 0 then
    return results[1]
  else
    return nil
  end
end

function remove_file_extension(filename)
  return filename:match("(.+)%..+$") or filename
end

function glob_in_cwd(pattern)
  local results = vim.fn.glob(vim.loop.cwd() .. "/" .. pattern, true, true)
  if #results > 0 then
    return results
  else
    return nil
  end
end

function file_in_cwd(filename)
  if vim.loop.fs_stat(vim.loop.cwd() .. "/" .. filename) then
    return true
  else
    return false
  end
end

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

-- Autocmd
local overseer = require("overseer")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.rs",
  callback = function()
    overseer.new_task({
      cmd = { "cargo" },
      args = { "test" },
      cwd = vim.fn.getcwd(),
      components = {
        "default",
        "on_output_quickfix",   -- populate quickfix with errors
        "on_result_diagnostics",-- LSP-style diagnostics in the file
      },
    }):start()
  end,
})
