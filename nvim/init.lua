local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {

  { import = 'custom' },
  { import = 'custom/plugins' },
  { import = 'custom/extras' },
  { import = 'custom/plugins/lang' },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('which-key').setup()

      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match '/node_modules/' then
          return
        end

        return { timeout_ms = 5000, lsp_fallback = true, async = true }
      end,
      format_after_save = { lsp_fallback = true },
      formatters_by_ft = {
        lua = { 'stylua' },
        --
        python = { 'black' },
        --
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        vue = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
        less = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        ['markdown.mdx'] = { 'prettier' },
        graphql = { 'prettier' },
        handlebars = { 'prettier' },
      },
    },
    config = function(_, opts)
      local conform = require 'conform'
      conform.setup(opts)

      -- Customize prettier args
      require('conform.formatters.prettier').args = function(self, ctx)
        local prettier_roots = { '.prettierrc', '.prettierrc.json', 'prettier.config.js' }
        local args = { '--stdin-filepath', '$FILENAME' }

        local localPrettierConfig = vim.fs.find(prettier_roots, {
          upward = true,
          path = ctx.dirname,
          type = 'file',
        })[1]
        local globalPrettierConfig = vim.fs.find(prettier_roots, {
          path = vim.fn.stdpath 'config',
          type = 'file',
        })[1]
        local disableGlobalPrettierConfig = os.getenv 'DISABLE_GLOBAL_PRETTIER_CONFIG'

        -- Project config takes precedence over global config
        if localPrettierConfig then
          vim.list_extend(args, { '--config', localPrettierConfig })
        elseif globalPrettierConfig and not disableGlobalPrettierConfig then
          vim.list_extend(args, { '--config', globalPrettierConfig })
        end

        local hasTailwindPrettierPlugin = vim.fs.find('node_modules/prettier-plugin-tailwindcss', {
          upward = true,
          path = ctx.dirname,
          type = 'directory',
        })[1]

        if hasTailwindPrettierPlugin then
          vim.list_extend(args, { '--plugin', 'prettier-plugin-tailwindcss' })
        end

        return args
      end
    end,
  },

  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { 'MunifTanjim/nui.nvim' },
}
