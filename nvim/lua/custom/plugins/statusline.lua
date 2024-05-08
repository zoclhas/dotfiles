return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox_dark',
        },
        sections = {
          lualine_c = {
            'lsp_progress',
            {
              'filename',
              path = 1,
            },
          },
          -- lualine_x = {
          --   {
          --     require('noice').api.statusline.mode.get,
          --     cond = require('noice').api.statusline.mode.has,
          --     color = { fg = '#ff9e64' },
          --   },
          -- },
          lualine_z = { 'location' },
        },
      }
    end,
  },
}
