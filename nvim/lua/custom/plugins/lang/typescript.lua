-- Also includes TailwindCSS
return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'typescript', 'tsx' })
      end
    end,
  },
  {
    'neovim/nvim-lspconfig',
    -- ft = { 'typescript', 'tsx', 'javascript', 'jsx', 'javascriptreact', 'typescriptreact' },
    opts = {
      -- make sure mason installs the server
      servers = {
        tailwindcss = {
          filetypes_exclude = { 'markdown' },
          settings = {
            tailwindCSS = {
              includeLanguages = { 'rust', 'typescript', 'javascript', 'html', 'css' },
            },
          },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          local tw = require 'lspconfig.server_configurations.tailwindcss'
          opts.filetypes = opts.filetypes or {}

          vim.list_extend(opts.filetypes, tw.default_config.filetypes)

          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, opts.filetypes)

          -- Add additional filetypes
          vim.list_extend(opts.filetypes, opts.filetypes_include or {})
        end,
      },
    },
  },
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, 'js-debug-adapter')
    end,
  },

  {
    'js-everts/cmp-tailwind-colors',
    opts = function()
      require('cmp-tailwind-colors').setup {
        enable_alpha = true,

        format = function(itemColor)
          return {
            fg = itemColor,
            bg = itemColor,
          }
        end,
      }
    end,
  },

  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup {
        ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = true,
        ---@type boolean Node with syntax error will not be formatted
        check_syntax_error = true,
        ---If line after join will be longer than max value,
        ---@type number If line after join will be longer than max value, node will not be formatted
        max_join_length = 120000,
        ---Cursor behavior:
        ---hold - cursor follows the node/place on which it was called
        ---start - cursor jumps to the first symbol of the node being formatted
        ---end - cursor jumps to the last symbol of the node being formatted
        ---@type 'hold'|'start'|'end'
        cursor_behavior = 'hold',
        ---@type boolean Notify about possible problems or not
        notify = true,
        ---@type boolean Use `dot` for repeat action
        dot_repeat = true,
        ---@type nil|function Callback for treesj error handler. func (err_text, level, ...other_text)
        on_error = nil,
        ---@type table Presets for languages
        -- langs = {}, -- See the default presets in lua/treesj/langs
      }
    end,
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    ft = { 'typescript', 'tsx', 'javascript', 'jsx', 'javascriptreact', 'typescriptreact', 'vue' },
    config = function()
      require('typescript-tools').setup {}
    end,
    keys = {
      { '<leader>co', '<cmd>TSToolsOrganizeImports<cr>', desc = 'Organize imports' },
      { '<leader>cR', '<cmd>TSToolsRenameFile<cr>', desc = 'Rename file' },
      { '<leader>cq', '<cmd>TSToolsFixAll<cr>', desc = 'Fix all' },
      { '<leader>cd', '<cmd>TSToolsGoToSourceDefinition<cr>', desc = 'Go to source definition' },
      { '<leader>cf', '<cmd>TSToolsFileReferences<cr>', desc = 'File references' },
      { '<leader>ci', '<cmd>TSToolsAddMissingImports<cr>', desc = 'Add missing imports' },
    },
  },
}
