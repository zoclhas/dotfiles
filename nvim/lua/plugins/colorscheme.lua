return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("kanagawa").setup({
        compile = true,
        undercurl = true,
        undercurls = true,
        terminalColors = true,
        dimInactive = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "#16161D",
              },
            },
          },
        },
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        overrides = function(colors)
          return {
            heading1 = { fg = colors.palette.peachred, bold = true },
            heading2 = { fg = colors.palette.wavered, bold = true },
            heading3 = { fg = colors.palette.sakurapink, bold = true },
            heading4 = { fg = colors.palette.carpyellow, bold = true },
            headingrest = { fg = colors.palette.boatyellow2, bold = true },

            bold = { fg = colors.palette.boatyellow2, bold = true },
            italics = { fg = colors.palette.sakurapink, italic = true },
            quotes = { fg = colors.palette.dragonblue, italic = true },

            ["@string.regexp"] = { link = "@string.regex" },
            ["@variable.parameter"] = { link = "@parameter" },
            ["@exception"] = { link = "@exception" },
            ["@string.special.symbol"] = { link = "@symbol" },
            ["@markup.strong"] = { link = "@text.strong", bold = true },
            ["@markup.italic"] = { link = "@text.emphasis", italic = true },
            ["@markup.underline"] = { link = "@text.underline" },
            ["@markup.heading"] = { link = "function" },
            ["@markup.raw"] = { link = "@text.literal" },
            ["@markup.quote"] = { link = "@text.quote" },
            ["@markup.math"] = { link = "constant" },
            ["@markup.environment"] = { link = "@text.environment" },
            ["@markup.environment.name"] = { link = "@text.environment.name" },
            ["@markup.link.url"] = { link = "special" },
            ["@markup.link.label"] = { link = "identifier" },
            ["@comment.note"] = { link = "@text.note" },
            ["@comment.warning"] = { link = "@text.warning" },
            ["@comment.danger"] = { link = "@text.danger" },
            ["@diff.plus"] = { link = "@text.diff.add" },
            ["@diff.minus"] = { link = "@text.diff.delete" },
            ["@markup.link.url.markdown_inline"] = { link = "special" }, -- (url)
            ["@markup.link.label.markdown_inline"] = { link = "warningmsg" }, -- [label]
            ["@markup.italic.markdown_inline"] = { link = "italics" }, -- *italic*
            ["@markup.strong.markdown_inline"] = { link = "bold" }, -- **strong**
            ["@markup.raw.markdown_inline"] = { link = "string" }, -- `code`
            ["@markup.list.markdown"] = { link = "function" }, -- + list
            ["@markup.quote.markdown"] = { link = "quotes" }, -- > blockcode
            ["@markup.heading.1.markdown"] = { link = "heading1" },
            ["@markup.heading.2.markdown"] = { link = "heading2" },
            ["@markup.heading.3.markdown"] = { link = "heading3" },
            ["@markup.heading.4.markdown"] = { link = "heading4" },
            ["@markup.heading.5.markdown"] = { link = "headingrest" },
            ["@markup.heading.6.markdown"] = { link = "headingrest" },
          }
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })

      vim.cmd.colorscheme("kanagawa")
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
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },

  {
    "slugbyte/lackluster.nvim",
    lazy = false,
  },

  {
    "ficcdaf/ashen.nvim",
    lazy = false,
  },

  { "ilof2/posterpole.nvim" },
}
