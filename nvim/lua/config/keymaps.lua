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

vim.keymap.del({ "i", "n" }, "<C-s>")
-- Autofill the useState variable from say `const [visible]` -> `const [visible, setVisible] = useState()`
vim.keymap.set(
  { "i", "n" },
  "<C-s>",
  "<ESC>F[yi[f]i, <ESC>pb<S-~>hiset<ESC><S-a> = useState()<ESC>F(a",
  { desc = "Tiny snippet for useEffect" }
)

vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
