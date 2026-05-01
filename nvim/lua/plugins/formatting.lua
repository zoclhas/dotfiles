return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    local function get_formatter(biome_formats)
      return function()
        -- Check if biome.json or biome.jsonc exists in project root
        local biome_config = vim.fn.findfile("biome.json", ".;") ~= "" or vim.fn.findfile("biome.jsonc", ".;") ~= ""

        if biome_config then
          return { "prettier" }
          -- return biome_formats
        else
          return { "prettier" }
        end
      end
    end

    opts.formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = get_formatter({ "biome", "biome-organize-imports" }),
      typescript = get_formatter({ "biome", "biome-organize-imports" }),
      javascriptreact = get_formatter({ "biome", "biome-organize-imports" }),
      typescriptreact = get_formatter({ "biome", "biome-organize-imports" }),
      vue = get_formatter({ "biome", "biome-organize-imports" }),
      css = get_formatter({ "biome", "biome-organize-imports" }),
      html = get_formatter({ "biome", "biome-organize-imports" }),
      json = get_formatter({ "biome", "biome-organize-imports" }),
      jsonc = get_formatter({ "biome", "biome-organize-imports" }),
      yaml = get_formatter({ "biome", "biome-organize-imports" }),
      markdown = get_formatter({ "biome", "biome-organize-imports" }),
      graphql = get_formatter({ "biome", "biome-organize-imports" }),
      c = { "clang_format" },
      cpp = { "clang_format" },
    }
  end,
}
