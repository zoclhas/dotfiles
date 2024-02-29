return {
  'rebelot/kanagawa.nvim',
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

    require('kanagawa').setup {
      compile = true,
      undercurls = true,

      transparent = ternary(vim.g.neovide, false, true),
      terminalColors = true,

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },

      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
          FloatTitle = { bg = 'none' },

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
      end,
    }

    vim.cmd.colorscheme 'kanagawa-dragon'
    vim.cmd.hi 'Comment gui=none'
  end,
}
