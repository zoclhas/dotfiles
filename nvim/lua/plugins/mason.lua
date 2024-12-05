return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua", -- Used to format lua code
        "prettier",
        "python-lsp-server",
        "black",
        -- "basedpyright",
        "yaml-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "svelte-language-server",
        -- "rust-analyzer",
        "ruff",
        "html-lsp",
        "glsl_analyzer",
        "dockerfile-language-server",
        "djlint",
        "css-lsp",
        "marksman",
        "markdownlint",
        "vue-language-server",
        "clangd",
      },
    })
  end,
}
