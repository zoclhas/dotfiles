return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local function ternary(cond, T, F)
        if cond then
          return T
        else
          return F
        end
      end

      require("kanagawa").setup({
        compile = true,
        undercurls = true,

        -- transparent = ternary(vim.g.neovide, false, true),
        transparent = false,
        terminalColors = true,

        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },

        overrides = function(colors)
          local theme = colors.theme

          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

            NeoTreeNormal = { bg = theme.ui.bg_dim },
            NeoTreeNormalNC = { bg = theme.ui.bg_dim },

            -- LineNrAbove = { bg = theme.ui.bg_dim },
            LineNr = { bg = theme.ui.bg_dim },
            -- LineNrBelow = { bg = theme.ui.bg_dim },

            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            Heading1 = { fg = colors.palette.peachRed, bold = true },
            Heading2 = { fg = colors.palette.waveRed, bold = true },
            Heading3 = { fg = colors.palette.sakuraPink, bold = true },
            Heading4 = { fg = colors.palette.carpYellow, bold = true },
            HeadingRest = { fg = colors.palette.boatYellow2, bold = true },

            Bold = { fg = colors.palette.boatYellow2, bold = true },
            Italics = { fg = colors.palette.sakuraPink, italic = true },
            Quotes = { fg = colors.palette.dragonBlue, italic = true },

            ["@string.regexp"] = { link = "@string.regex" },
            ["@variable.parameter"] = { link = "@parameter" },
            ["@exception"] = { link = "@exception" },
            ["@string.special.symbol"] = { link = "@symbol" },
            ["@markup.strong"] = { link = "@text.strong", bold = true },
            ["@markup.italic"] = { link = "@text.emphasis", italic = true },
            ["@markup.underline"] = { link = "@text.underline" },
            ["@markup.heading"] = { link = "Function" },
            ["@markup.raw"] = { link = "@text.literal" },
            ["@markup.quote"] = { link = "@text.quote" },
            ["@markup.math"] = { link = "Constant" },
            ["@markup.environment"] = { link = "@text.environment" },
            ["@markup.environment.name"] = { link = "@text.environment.name" },
            ["@markup.link.url"] = { link = "Special" },
            ["@markup.link.label"] = { link = "Identifier" },
            ["@comment.note"] = { link = "@text.note" },
            ["@comment.warning"] = { link = "@text.warning" },
            ["@comment.danger"] = { link = "@text.danger" },
            ["@diff.plus"] = { link = "@text.diff.add" },
            ["@diff.minus"] = { link = "@text.diff.delete" },
            ["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
            ["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
            ["@markup.italic.markdown_inline"] = { link = "Italics" }, -- *italic*
            ["@markup.strong.markdown_inline"] = { link = "Bold" }, -- **strong**
            ["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
            ["@markup.list.markdown"] = { link = "Function" }, -- + list
            ["@markup.quote.markdown"] = { link = "Quotes" }, -- > blockcode
            ["@markup.heading.1.markdown"] = { link = "Heading1" },
            ["@markup.heading.2.markdown"] = { link = "Heading2" },
            ["@markup.heading.3.markdown"] = { link = "Heading3" },
            ["@markup.heading.4.markdown"] = { link = "Heading4" },
            ["@markup.heading.5.markdown"] = { link = "HeadingRest" },
            ["@markup.heading.6.markdown"] = { link = "HeadingRest" },
          }
        end,
      })

      vim.cmd.colorscheme("kanagawa-dragon")
      vim.cmd.hi("Comment gui=none")
    end,
  },

  {
    "vague2k/vague.nvim",
    config = function()
      local b = "bold"
      local i = "italic"
      require("vague").setup({
        boolean = b,
        error = i,
        conditionals = i,
        functions = i,

        keywords = i,
        keyword_return = i,
        keywords_loop = i,
        keywords_label = i,
        keywords_exception = i,

        builtin_constants = i,
        builtin_functions = i,
        builtin_types = i,
        builtin_variables = i,
      })
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },
}

-- return
