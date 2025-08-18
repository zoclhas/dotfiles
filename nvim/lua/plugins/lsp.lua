return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").qmlls.setup({})
  end,
}
