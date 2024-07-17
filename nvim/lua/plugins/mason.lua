---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
        "python-lsp-server",
        "black",
        "basedpyright",
        "yaml-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "svelte-language-server",
        "rust-analyzer",
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
    },
  },
}
