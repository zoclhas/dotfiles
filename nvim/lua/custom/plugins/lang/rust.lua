return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'Saecki/crates.nvim',
        event = { 'BufRead Cargo.toml' },
        opts = {
          src = {
            cmp = { enabled = true },
          },
        },
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = 'crates' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'ron', 'rust', 'toml' })
      end
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            'html',
            'css',
            'sass',
            'scss',
            'less',
          },
        },
        taplo = {
          keys = {
            {
              'K',
              function()
                if vim.fn.expand '%:t' == 'Cargo.toml' and require('crates').popup_available() then
                  require('crates').show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = 'Show Crate Documentation',
            },
          },
        },
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      {
        'lvimuser/lsp-inlayhints.nvim',
        opts = {},
      },
    },
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        inlay_hints = {
          highlight = 'NonText',
        },
        tools = {},
        server = {
          on_attach = function(client, bufnr)
            require('lsp-inlayhints').on_attach(client, bufnr)
          end,
        },
      }
    end,
  },

  {
    'rouge8/neotest-rust',
  },
  {
    'williamboman/mason.nvim',
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'codelldb' })
      end
    end,
  },
}
