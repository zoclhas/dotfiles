local Util = require("lazyvim.util")

vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, { border = "rounded" })
end, { desc = "Terminal (root dir )" })

vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "move end of line" })

vim.keymap.set("i", "<C-BS>", "<Esc>cvb", {})
vim.keymap.set("n", "<CR>", "ciw")

vim.keymap.set("i", "<C-v>", "<CR><ESC>O<Tab>", { desc = "Place cursor inbetween the tags on a new line" })
vim.keymap.set("i", "<C-p>", "<ESC>o", { desc = "Make a new line below" })
