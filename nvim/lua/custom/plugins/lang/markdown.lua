return {

  {
    'iamcco/markdown-preview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = 'markdown',
    build = function()
      local install_path = vim.fn.stdpath 'data' .. '/lazy/markdown-preview.nvim/app'
      vim.cmd('silent !cd ' .. install_path .. ' && yarn install && git restore .')
    end,
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      -- vim.g.mkdp_auto_close = 0
    end,
    config = function()
      vim.opt.conceallevel = 2
      vim.cmd [[do FileType]]
    end,
  },

  {
    'lukas-reineke/headlines.nvim',
    opts = function()
      local opts = {}
      for _, ft in ipairs { 'markdown', 'norg', 'rmd', 'org' } do
        opts[ft] = {
          headline_highlights = {},
        }
        for i = 1, 6 do
          local hl = 'Headline' .. i
          vim.api.nvim_set_hl(0, hl, { link = 'Headline', default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    ft = { 'markdown', 'norg', 'rmd', 'org' },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require('headlines').setup(opts)
        require('headlines').refresh()
      end)
    end,
  },
}
