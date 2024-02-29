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
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.tsserver
        tsserver = {
          keys = {
            {
              '<leader>co',
              function()
                vim.lsp.buf.code_action {
                  apply = true,
                  context = {
                    only = { 'source.organizeImports.ts' },
                    diagnostics = {},
                  },
                }
              end,
              desc = 'Organize Imports',
            },
            {
              '<leader>cR',
              function()
                vim.lsp.buf.code_action {
                  apply = true,
                  context = {
                    only = { 'source.removeUnused.ts' },
                    diagnostics = {},
                  },
                }
              end,
              desc = 'Remove Unused Imports',
            },
          },
          ---@diagnostic disable-next-line: missing-fields
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
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
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    config = function()
      require('tailwind-sorter').setup {
        on_save_enabled = true,
        on_save_pattern = { '*.html', '*.jsx', '*.tsx', '*.rs' },
      }
    end,
  },
  -- { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },
}
