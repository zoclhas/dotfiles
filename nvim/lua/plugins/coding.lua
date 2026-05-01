return {
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "Abstract-IDE/abstract-autocmds",
    lazy = false,
    config = function()
      require("abstract-autocmds").setup({
        clear_last_used_search = true,
        give_border = {
          enable = true,
          opts = {
            pattern = { "null-ls-info", "lspinfo" },
          },
        },
        smart_visual_paste = true,
        smart_dd = true,
        visually_codeblock_shift = true,
        ctrl_backspace_delete = {
          enable = true,
          opts = {
            insert_mode = true,
            cmd_mode = false,
          },
        },
      })
    end,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup({
        virtual_text = false,
      })
    end,
  },
}
