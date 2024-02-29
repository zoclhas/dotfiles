return {
  {
    'MeanderingProgrammer/dashboard.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      { 'MaximilianLloyd/ascii.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },
    },
    config = function()
      require('dashboard').setup {
        header = require('ascii').art.text.neovim.bloody,
        date_format = '%d-%m-%Y %H:%M:%S',
        directories = {
          '~/.config',
          '~/Desktop/code',
        },
      }
    end,
  },
}
