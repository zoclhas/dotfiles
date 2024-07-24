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
