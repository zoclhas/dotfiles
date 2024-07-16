---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "typescript",
      "markdown",
      "html",
      "css",
      "rust",
      "python",
    },
  },
}
