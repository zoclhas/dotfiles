return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  opts = function(_, opts)
    require("treesitter-context").setup({
      enable = true,
      multiline_threshold = 2,
    })

    vim.keymap.set("n", "[c", function()
      require("treesitter-context").go_to_context(vim.v.count1)
    end, { silent = true })

    opts.ensure_installed = {
      "bash",
      "c",
      "html",
      "lua",
      "vim",
      "vimdoc",
      "typescript",
      "python",
      "javascript",
      "rust",
      "markdown",
      "markdown_inline",
      "go",
      "gomod",
      "gowork",
      "gosum",
      "vue",
      "glsl",
    }

    opts.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        scope_incremental = "<CR>",
        node_incremental = "v",
        node_decremental = "V",
      },
    }
  end,
}
