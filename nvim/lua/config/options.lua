vim.opt.scrolloff = 10
vim.opt.wrap = true

vim.filetype.add({
  extension = { rasi = "rasi" },
  pattern = {
    [".*/waybar/config"] = "jsonc",
    [".*/mako/config"] = "dosini",
    [".*/kitty/*.conf"] = "bash",
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".env*"] = "conf",
  },
})

vim.g.lazyvim_prettier_needs_config = false

vim.g.snacks_animate = false
