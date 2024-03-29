local Util = require 'util'

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Some QoL improvements
-- vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'Go to end of line' })
vim.keymap.set('i', '<C-b>', '<Home>', { desc = 'Go to start of line' })

vim.keymap.set('i', '<C-v>', '<CR><ESC>O', { desc = 'Place cursor inbetween the tags on a new line' })

-- Move Lines
vim.keymap.set('n', '<C-o>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
vim.keymap.set('n', '<C-p>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
vim.keymap.set('i', '<C-n>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
vim.keymap.set('i', '<C-m>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
vim.keymap.set('v', '<C-n>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
vim.keymap.set('v', '<C-m>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- restore the session for the current directory
vim.api.nvim_set_keymap('n', '<leader>qs', [[<cmd>lua require("persistence").load()<cr>]], {})
-- restore the last session
vim.api.nvim_set_keymap('n', '<leader>ql', [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})
-- stop Persistence => session won't be saved on exit
vim.api.nvim_set_keymap('n', '<leader>qd', [[<cmd>lua require("persistence").stop()<cr>]], {})

-- Others
vim.keymap.set('i', '<C-BS>', '<Esc>cvb', {})
vim.keymap.set('n', '<CR>', 'ciw')
vim.keymap.set('n', ';', "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_ivy({}))<cr>", opts)

-- Cursor to not jump back to where you started your selection
vim.keymap.set('v', 'y', 'ygv<esc>')

-- Terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
vim.keymap.set('n', '<C-i>', lazyterm, { desc = 'Terminal (cwd dir)' })
vim.keymap.set('n', '<C-_>', lazyterm, { desc = 'Terminal (cwd dir)' })
vim.keymap.set('n', '<C-u>', function()
  Util.terminal()
end, { desc = 'Terminal (cwd)' })
-- vim.keymap.set('n', '<c-/>', lazyterm, { desc = 'Terminal (root dir)' })
vim.keymap.set('n', '<C-\\>', lazyterm, { desc = 'which_key_ignore' })

return {}
