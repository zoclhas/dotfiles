return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
