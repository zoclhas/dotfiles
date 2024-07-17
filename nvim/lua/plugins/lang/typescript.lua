return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "tsx", "javascript", "jsx", "javascriptreact", "typescriptreact", "vue" },
    config = function() require("typescript-tools").setup {} end,
    keys = {
      { "<leader>lto", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize imports" },
      { "<leader>ltR", "<cmd>TSToolsRenameFile<cr>", desc = "Rename file" },
      { "<leader>ltq", "<cmd>TSToolsFixAll<cr>", desc = "Fix all" },
      { "<leader>ltd", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to source definition" },
      { "<leader>ltf", "<cmd>TSToolsFileReferences<cr>", desc = "File references" },
      { "<leader>lti", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add missing imports" },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup {
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "rescript",
          "xml",
          "php",
          "markdown",
          "rust",
        },
      }
    end,
  },
}
