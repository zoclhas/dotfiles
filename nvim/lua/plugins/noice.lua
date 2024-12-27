return {
  {
    "folke/noice.nvim",
    opts = {
      notify = {
        enabled = false,
      },
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = false,
        },
        messages = {
          enabled = false,
        },
        popupmenu = {
          enabled = false,
        },
        presets = {
          lsp_doc_border = true,
        },
      })
    end,
  },
  { "rcarriga/nvim-notify", enabled = false },
}
