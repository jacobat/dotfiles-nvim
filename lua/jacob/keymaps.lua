-- set leader key to space
vim.g.mapleader = " "

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

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- buffers
keymap.set("n", "<leader>bda", ":%bd<CR>") -- Delete all buffers
keymap.set("n", "<leader>dba", ":%bd<CR>") -- Delete all buffers

-- shortcut to edit config
keymap.set("n", "<leader>gv", ":edit $MYVIMRC<CR>")

-- tests
keymap.set("n", "<leader>rs", function() require('neotest').run.run(vim.fn.expand('%')) end, {})
keymap.set("n", "<leader>ra", function() require('neotest').run.run(vim.fn.getcwd()) end, {})
keymap.set("n", "<leader>rt", function() require('neotest').summary.toggle() end, {})

keymap.set("n", "<leader>e", ":edit <C-R>=expand('%:p:h') . \"/\" <CR>")

----------------------
-- Plugin Keybinds
----------------------

-- mysitter
keymap.set("x", "fg", function() require('jacob.mysitter').method_for_node() end, { noremap = true, silent = true})
keymap.set("o", "ag", function() require('jacob.mysitter').method_for_node() end, { noremap = true, silent = true})
keymap.set("n", "ag", function() require('jacob.mysitter').method_for_node() end, { noremap = true, silent = true})

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>tt", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ta", function() require('telescope.builtin').tags() end, {})
keymap.set("n", "<leader>te", function() require('telescope.builtin').find_files({ cwd = "app/events" }) end, {})
keymap.set("n", "<leader>tm", function() require('telescope.builtin').find_files({ cwd = "app/models" }) end, {})
keymap.set("n", "<leader>tc", function() require('telescope.builtin').find_files({ cwd = "app/controllers" }) end, {})
keymap.set("n", "<leader>ts", function() require('telescope.builtin').find_files({ cwd = "spec" }) end, {})
keymap.set("n", "<leader>tga", "<cmd>Telescope live_grep cwd=app<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>tgs", "<cmd>Telescope live_grep cwd=spec<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>tgl", "<cmd>Telescope live_grep cwd=lib<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>tgg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>tw", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>l", function() require('telescope.builtin').current_buffer_tags() end, {})

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
-- keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Trevj plugin
vim.keymap.set("n", "<leader>k", function() require("trevj").format_at_cursor() end)

-- Projectionist
vim.keymap.set("n", "<leader>a", ":A<CR>") -- go to alternate file

-- Gitsigns
vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_linehl<CR>")

-- Tab to tab
vim.keymap.set("n", "<tab>", ":bn<CR>")
vim.keymap.set("n", "<s-tab>", ":bp<CR>")
