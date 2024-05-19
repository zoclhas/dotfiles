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
vim.keymap.set('t', '<c-_>', '<cmd>close<cr>', { desc = 'which_key_ignore' })

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
vim.keymap.set('v', '<leader>p', '_dP')

vim.keymap.set('i', '<C-v>', '<CR><ESC>O', { desc = 'Place cursor inbetween the tags on a new line' })
vim.keymap.set('i', '<C-p>', '<ESC>o', { desc = 'Make a new line below' })

-- Move Lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- restore the session for the current directory
vim.api.nvim_set_keymap('n', '<leader>qs', [[<cmd>lua require("persistence").load()<cr>]], {})
-- restore the last session
vim.api.nvim_set_keymap('n', '<leader>ql', [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})
-- stop Persistence => session won't be saved on exit
vim.api.nvim_set_keymap('n', '<leader>qd', [[<cmd>lua require("persistence").stop()<cr>]], {})

-- Others
vim.keymap.set('i', '<C-BS>', '<Esc>cvb', {})
vim.keymap.set('n', '<CR>', 'ciw')
-- vim.keymap.set('n', ';', "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_ivy({}))<cr>", opts)

-- Cursor to not jump back to where you started your selection
vim.keymap.set('v', 'y', 'ygv<esc>')

-- Terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root(), border = 'rounded', style = 'minimal', backdrop = 1 })
end
vim.keymap.set('n', '<C-i>', lazyterm, { desc = 'Terminal (root dir)' })
vim.keymap.set('n', '<C-_>', lazyterm, { desc = 'Terminal (root dir)' })
-- vim.keymap.set('n', '<C-u>', function()
--   Util.terminal()
-- end, { desc = 'Terminal (cwd)' })
vim.keymap.set('n', '<c-/>', lazyterm, { desc = 'Terminal (root dir)' })
vim.keymap.set('n', '<c-?>', function()
  Util.terminal(nil, { border = 'rounded' })
end, { desc = 'Terminal (cwd dir)' })
vim.keymap.set('n', '<C-\\>', lazyterm, { desc = 'which_key_ignore' })

-- show diagnostics
vim.keymap.set('n', '<C-n>', '', {
  callback = function()
    vim.diagnostic.open_float()
  end,
})

-- Windows
vim.keymap.set('n', '<leader>ww', '<C-W>p', { desc = 'Other Window', remap = true })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })
vim.keymap.set('n', '<leader>w-', '<C-W>s', { desc = 'Split Window Below', remap = true })
vim.keymap.set('n', '<leader>w|', '<C-W>v', { desc = 'Split Window Right', remap = true })
vim.keymap.set('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
vim.keymap.set('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })

-- Movement
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'move end of line' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'move left' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'move right' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'move down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'move up' })

vim.keymap.set({ 'i', 'n' }, '<leader>dc', '<cmd>noh<cr>', { desc = 'Remove search highlights' })

return {}
