-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>n", ":nohl<CR>")

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- Copy buffer path to paste buffer
keymap.set("n", "<leader>cp", ":let @+ = expand('%:p')<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- buffers
keymap.set("n", "<leader>bda", ":%bd<CR>") -- Delete all buffers
keymap.set("n", "<leader>dba", ":%bd<CR>") -- Delete all buffers

-- shortcut to edit config
keymap.set("n", "<leader>gv", ":edit $MYVIMRC<CR>")

-- Edit files in same directory as current buffer
keymap.set("n", "<leader>e", ":edit <C-R>=expand('%:p:h') . \"/\" <CR>")

-- Folding keymaps
keymap.set("n", "<leader>ft", ":set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()<CR>")
keymap.set("n", "<leader>fen", ":set fen<CR>")
keymap.set("n", "<leader>fno", ":set nofen<CR>")

local opts = { noremap = true, silent = true }
-- Diagnostic keymaps
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>dd', function()
  local themes = require('telescope.themes')
  require("telescope.builtin").diagnostics(themes.get_dropdown({layout_config = { width = 0.8 }}))
end, opts)


----------------------
-- Plugin Keybinds
----------------------

-- tests
keymap.set("n", "<leader>rr", function() require('neotest').run.run() end, { desc = "Run nearest test" })
keymap.set("n", "<leader>rl", function() require('neotest').run.run_last() end, { desc = "Rerun last test" })
keymap.set("n", "<leader>rs", function() require('neotest').run.run({vim.fn.expand('%')}) end, { desc = "Run tests for current file" })
keymap.set("n", "<leader>rf", function() require('neotest').run.run(vim.fn.expand('%')) end, { desc = "Run tests for current file" })
keymap.set("n", "<leader>ra", function() require('neotest').run.run(vim.fn.getcwd()) end, { desc = "Run tests for cwd" })
keymap.set("n", "<leader>rt", function() require('neotest').summary.toggle() end, { desc = "Open neotest summary" })
keymap.set("n", "<leader>ro", function() require('neotest').output.open() end, { desc = "Open neotest output" })
-- keymap.set("n", "<leader>rp", function() require('neotest').jump.prev({ status = "failed" }) end, { desc = "Jump to previous test failure" })
-- keymap.set("n", "<leader>rn", function() require('neotest').jump.next({ status = "failed" }) end, { desc = "Jump to next test failure" })

-- keymap.set("n", "<leader>rs", function() require("rspec").run_suite() end, { desc = "Run spec suite" })
-- keymap.set("n", "<leader>rf", function() require("rspec").run_current_file() end, { desc = "Run spec file" })
-- keymap.set("n", "<leader>re", function() require("rspec").run_current_example() end, { desc = "Run spec example" })
-- keymap.set("n", "<leader>rd", function() require("rspec").debug() end, { desc = "Debug spec" })
-- keymap.set("n", "<leader>rl", function() require("rspec").repeat_last_run() end, { desc = "Repeat spec run" })

-- vim-maximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

function find_files_in(subdir)
  local scan = require'plenary.scandir'
  local p = scan.scan_dir('./packs', { hidden = false, depth = 1, only_dirs = true })
  local search_dirs = {subdir}
  for k,v in ipairs(p) do
    table.insert(search_dirs, v .. "/" .. subdir)
  end
  require('telescope.builtin').find_files({search_dirs = search_dirs})
end

-- telescope
keymap.set("n", "<leader>tt", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
-- find files, exluding specs
keymap.set("n", "<leader>tsf", function() require('telescope.builtin').find_files({find_command = {'fd', '--exclude', '**spec.rb', '--exclude', 'spec'}}) end, {})
-- find word, exluding specs
keymap.set("n", "<leader>tsw", function() require('telescope.builtin').grep_string({word_match='-w', additional_args={'--glob', '!**spec.rb', '--glob', '!spec', '--glob', '*.rb'}}) end, {})
keymap.set("n", "<leader>tr", function() require('telescope').extensions.recent_files.pick({only_cwd = true}) end, {}) -- find recently opened files
keymap.set("n", "<leader>tgg", "<cmd>Telescope git_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ta", function() require('telescope.builtin').tags() end, {})
keymap.set("n", "<leader>pfe", function() find_files_in("app/events") end, { desc = "Find app/events/ in packs" })
keymap.set("n", "<leader>pfm", function() find_files_in("app/models") end, { desc = "Find app/models/ in packs" })
keymap.set("n", "<leader>pfc", function() find_files_in("app/controllers") end, { desc = "Find app/controllers/ in packs" })
keymap.set("n", "<leader>pfs", function() find_files_in("spec") end, { desc = "Find spec/ in packs" })
keymap.set("n", "<leader>pfl", function() find_files_in("lib") end, { desc = "Find lib/ in packs" })
keymap.set("n", "<leader>tga", function() require('telescope').extensions.live_grep_args.live_grep_args() end, {}) -- find string in current working directory as you type
keymap.set("n", "<leader>tgs", "<cmd>Telescope live_grep cwd=spec<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>tgl", "<cmd>Telescope live_grep cwd=lib<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>tgd", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>tw", "<cmd>Telescope grep_string word_match=-w<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>hm", "<cmd>Telescope harpoon marks<cr>") -- list available harpoon marks
keymap.set("n", "<leader>tss", "<cmd>Telescope session-lens<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>ht", function() require('harpoon.mark').toggle_file() end, {})
keymap.set("n", "<leader>tlr", function() require('telescope.builtin').lsp_references() end, {})
keymap.set("n", "<leader>tld", function() require('telescope.builtin').lsp_definitions() end, {})
keymap.set("n", "<leader>,", function() require('telescope.builtin').current_buffer_tags() end, {})
keymap.set("n", "<leader>tq", function() require('telescope.builtin').quickfix() end, {})
keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, {})

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- Neogit
keymap.set("n", "<leader>gn", "<cmd>Neogit<cr>")

-- restart lsp server (not on youtube nvim video)
-- keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Trevj plugin
vim.keymap.set("n", "<leader>k", function() require("trevj").format_at_cursor() end)

-- Projectionist
vim.keymap.set("n", "<leader>a", ":A<CR>") -- go to alternate file

-- Gitsigns
vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_linehl<CR>")

-- Tab to tab
vim.keymap.set("n", "<tab>", "<cmd>bn<CR>")
vim.keymap.set("n", "<s-tab>", "<cmd>bp<CR>")

-- Lsp
keymap.set('n', '<leader>de', vim.diagnostic.open_float)
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<leader>dq', vim.diagnostic.setloclist)

-- Close any of the patterns with just q
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "checkhealth",
        "fugitive*",
        "git",
        "help",
        "lspinfo",
        "netrw",
        "notify",
        "qf",
        "query",
    },
    callback = function()
        vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close the current buffer", buffer = true })
    end,
})

-- Oil
keymap.set('n', '<leader>od', function() require('oil').open_float() end)
keymap.set('n', '<leader>of', function() require('oil').open_float(vim.fn.getcwd()) end)

-- Gitportal
vim.keymap.set("n", "<leader>gp", function() require('gitportal').open_file_in_browser() end)
vim.keymap.set("v", "<leader>gp", function() require('gitportal').open_file_in_browser() end)
vim.keymap.set('n', '<leader>ig', function() require('gitportal').open_file_in_neovim() end) 

-- Agitator
vim.keymap.set("n", "<leader>gb", function() require('agitator').git_blame_toggle() end)

-- Overseer
vim.keymap.set("n", "<leader>os", function() require('overseer').toggle() end)
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>")
vim.keymap.set("n", "<leader>oc", "<cmd>OverseerRunCmd<cr>")
